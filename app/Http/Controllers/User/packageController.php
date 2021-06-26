<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Helper\File_helper;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class packageController extends Controller{
    public $data = [];
    public function __construct() {
        $this->middleware('auth:web');
    }

    public function new(){
        $this->data['share_image']      = '';
        $this->data['meta_title']       = "Products";
        $this->data['meta_keyword']     = "this is meta keyword";
        $this->data['meta_description'] = "this is meta description";

        $this->data["result"] = \DB::table('btcs')->where(['status'=>1])->first();

        return view('user_panel/pages/packages')->with($this->data);
    }

    public function process_package($package_name)
    {
        switch ($package_name) {
            case 'bronze':
                $this->package_manager($package_name, 25);
                break;
            case 'silver':
                $this->package_manager($package_name, 50);
                break;
            case 'gold':
                $this->package_manager($package_name, 150);
                break;
            
            default:
                set_msg('Your Selected Package is Not Valid!', 'danger');
                break;
        }
        return redirect()->back();
    }


    private function package_manager($package_name, $price)
    {
        //check user balance
        if($balance = \DB::table('balance')->where([['user_id', '=', \Auth::id()], ['amount', '>=', $price]])->first())
        {
            // chack this user already have an activated package?
            if(!\DB::table('package')->where(['user_id'=>\Auth::id()])->first())
            {
                // add the package for this user
                $package_data = [
                    'user_id' => \Auth::id(),
                    'date'    => date('Y-m-d'),
                    'time'    => date('H:i:s'),
                    'package_name' => $package_name,
                    'price'        => $price
                ];

                if(\DB::table('package')->insert($package_data))
                {
                    /*add package activation history start*/
                        $package_history_data = [
                            'user_id' => \Auth::id(),
                            'date'    => date('Y-m-d'),
                            'time'    => date('H:i:s'),
                            'package_name' => $package_name,
                            'price'        => $price
                        ];
                        \DB::table('package_history')->insert($package_history_data);
                    /*add package activation history end*/

                    //minus the price amount from main balance
                    $new_balance = [
                        'amount' => ($balance->amount-$price)
                    ];
                    \DB::table('balance')->where(['user_id'=>\Auth::id()])->update($new_balance);

                    $this->work_with_referral_bonus();

                    set_msg('Your Package Activated Successfully!', 'success');
                }else{
                    set_msg('Your Package Not Activated, Please Try Again Later!', 'warning');
                }
            }else{
                set_msg('You have already a package, you can upgrade your package.', 'warning');
            }
        }else{
            set_msg('You don\'t have sufficient balance to buy this package.', 'warning');
        }
    }

    private function work_with_referral_bonus()
    {

        \DB::table('refferal_bonus')->where(['id_of_who_use_refferal_code'=>\Auth::id()])->update(['activation_status'=>1]);
        
        // level-2 referral comission activation, if available start
            $sponsore_id = \Auth::user()->sponsore_id;
            if($level_one_user = \DB::table('users')->where(['user_id'=>$sponsore_id])->first())
            {
                if($level_two_user = \DB::table('users')->where(['user_id'=>$level_one_user->sponsore_id])->first())
                {
                    \DB::table('refferal_bonus')->where(['id_of_referral_code_owner'=>$level_two_user->id])->update(['activation_status'=>1]);
                }
            }
        // level-2 referral comission activation, if available end
    }






    public function upgrade()
    {
        return view('user_panel/pages/package_upgrade')->with($this->data);
    }




    public function upgrade_process($package_name)
    {
        switch ($package_name) {
            case 'bronze':
                $this->package_upgrade_manager($package_name, 25);
                break;
            case 'silver':
                $this->package_upgrade_manager($package_name, 50);
                break;
            case 'gold':
                $this->package_upgrade_manager($package_name, 150);
                break;
            
            default:
                set_msg('Your Selected Package is Not Valid!', 'danger');
                break;
        }
        return redirect()->back();
    }


    private function package_upgrade_manager($package_name, $price)
    {
        // chack this user current package?
        if($current_package = \DB::table('package')->where(['user_id'=>\Auth::id()])->first())
        {
            
            $balance_need_to_upgrade = ($price - $current_package->price);

            //check user balance
            if($balance = \DB::table('balance')->where([['user_id', '=', \Auth::id()], ['amount', '>=', $balance_need_to_upgrade]])->first())
            {
                // add the package for this user
                $package_data = [
                    'date'    => date('Y-m-d'),
                    'time'    => date('H:i:s'),
                    'package_name' => $package_name,
                    'price'        => $price
                ];

                if(\DB::table('package')->where(['user_id'=>\Auth::id()])->update($package_data))
                {
                    /*add package activation history start*/
                        $package_history_data = [
                            'user_id' => \Auth::id(),
                            'date'    => date('Y-m-d'),
                            'time'    => date('H:i:s'),
                            'package_name' => $package_name,
                            'price'        => $price
                        ];
                        \DB::table('package_history')->insert($package_history_data);
                    /*add package activation history end*/

                    //minus the price amount from main balance
                    $new_balance = [
                        'amount' => ($balance->amount-$balance_need_to_upgrade)
                    ];
                    \DB::table('balance')->where(['user_id'=>\Auth::id()])->update($new_balance);

                    $this->package_upgrade_referral_bonus($package_name);

                    set_msg('Your Package Upgraded Successfully!', 'success');
                }else{
                    set_msg('Your Package Not Upgraded, Please Try Again Later!', 'warning');
                }
            }else{
                set_msg('You don\'t have sufficient balance to upgrade to this package.', 'warning');
            }
        }
    }



    private function package_upgrade_referral_bonus($package_name)
    {
        $package_referral_bonus = 0;
        switch ($package_name) {
            case 'bronze':
                $package_referral_bonus = 3;
                break;
            case 'silver':
                $package_referral_bonus = 8;
                break;
            case 'gold':
                $package_referral_bonus = 20;
                break;
            
            default:
                $package_referral_bonus = 0;
                break;
        }

        if($package_referral_bonus)
        {
            $referral_id = \Auth::user()->sponsore_id;
            $referral_id_woner = \DB::table('users')->where(['user_id'=>$referral_id])->first();

            if($referral_id_woner)
            {
                $refferal_bonus_data = [
                    'id_of_referral_code_owner'   => $referral_id_woner->id,
                    'date'                        => date('Y-m-d'),
                    'time'                        => date('H:i:s'),
                    'bonus_amount'                => $package_referral_bonus,
                    'id_of_who_use_refferal_code' => \Auth::id(),
                    'activation_status'           => 1
                ];

                \DB::table('refferal_bonus')->insert($refferal_bonus_data);
            }
        }
    }
}

