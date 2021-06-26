<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Helper\File_helper;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class dashboardController extends Controller{
    public $data = [];
    public function __construct() {
        $this->middleware('auth:web');
    }

    public function index(){
        $this->data['share_image']      = '';
        $this->data['meta_title']       = "Products";
        $this->data['meta_keyword']     = "this is meta keyword";
        $this->data['meta_description'] = "this is meta description";
        $this->update_user_level();

        $balance_info = \DB::table('balance')->where(['user_id'=>\Auth::id()])->first();
        if($balance_info)
        {
            $this->data['balance'] = $balance_info->amount;
        }else{
            $this->data['balance'] = 0;
        }

        $this->data['diposit'] = \DB::table('recharge_history')->where(['user_id'=>\Auth::id()])->sum('amount');

        return view('user_panel/pages/dashboard')->with($this->data);
    }


    private function update_user_level()
    {
        $refferal_id = \Auth::user()->user_id;

        $total_refferar = \DB::table('users')->where(['sponsore_id'=>$refferal_id])->count();

        $user_level = 0;
        switch ($total_refferar)
        {
            case 5:
                $user_level = 1;
                break;
            case 10:
                $user_level = 2;
                break;
            case 15:
                $user_level = 3;
                break;
            
            default:
                $user_level = 0;
                break;
        }

        \DB::table('users')->where(['id'=>\Auth::id()])->update(['user_level'=>$user_level]);
    }



    function profile_update(){
        return view('user_panel/pages/profile/profile_update')->with($this->data);
    }

    function profile_update_process(Request $request)
    {
        $data = [
            "name"          => $request->name,
            "phone"         => $request->phone,
            "email"         => $request->email,
            "date_of_birth" => $request->date_of_birth,
            "address"       => $request->address,
            "zip_code"      => $request->zip_code,
            "passport_no"   => $request->passport_no,
            "blood_group"   => $request->blood_group,
            "country_id"    => $request->country_code
        ];

        if(DB::table('users')->where(['id'=>\Auth::id()])->update($data))
        {
            set_msg('Profile Information Updated Successfully !', 'success');
            return redirect()->route('user.login');
        }else{
            set_msg('Profile Information Not Updated !', 'warning');
        }
        return redirect()->back();
    }


    function profile_img_update()
    {
        return view('user_panel/pages/profile/profile_img_update')->with($this->data);
    }

    function profile_img_update_process(Request $request)
    {
        $old_img  = \DB::table('users')->where(['id'=>\Auth::id()])->first();

        if($old_img && $old_img->img_name != null)
        {
            if(file_exists($old_img->img_name)){
                unlink($old_img->img_name);
            }
        }


        // image upload process start------------
        $img_name           = time();
        $profile_image_name = File_helper::uploadImgWithResize($request, "profile_img", $request->profile_img, $img_name, "public/userpanel/img/profile", 70, 400);

        // $this->create_image($request->profile_img, $img_name, $request->profile_img_width, $request->profile_img_height, 200, 'm', 70);
        // $this->create_image($request->profile_img, $img_name, $request->profile_img_width, $request->profile_img_height, 400, 'l', 70);
        // $profile_image_name = $this->create_image($request->profile_img, $img_name, $request->profile_img_width, $request->profile_img_height, 950, 'xl', 70);
        // image upload process end--------------
        

        $data = [
            'created_at'=>date("Y-m-d H:i:s"),
            'updated_at'=>date("Y-m-d H:i:s"),
            'img_name'  => $profile_image_name
        ];


        if(\DB::table('users')->where(['id'=>\Auth::id()])->update($data))
        {
            set_msg('Profile Image Updated Successfully!', 'success');
        }else{
            set_msg('Profile Image Not Updated!', 'danger');
        }

        return redirect()->back();
    }


    function password_update()
    {
        return view('user_panel/pages/profile/password_update')->with($this->data);
    } 


    function password_update_process(Request $request)
    {
        /*check existance of current password start*/        
        $user = \DB::table('users')->where(['id' => \Auth::id()])->first();
        
        $password_matched = Hash::check($request->current_password, $user->password);
        
        if($password_matched)
        {
            $data = [
                'password' => \Hash::make($request->new_password)
            ];
            
            if(\DB::table('users')->where(['id' => \Auth::id()])->update($data))
            {
                set_msg('Password successfully changed!', 'success');
            }else{
                set_msg('Password not changed!', 'warning');
            }
        }else{
            set_msg('Current Password Is Not Matched!', 'warning');
        }
        /* check existance of current password end */

        return redirect()->back();
    }


    function transection_id_update()
    {
        return view('user_panel/pages/profile/transection_id_update')->with($this->data);
    }


    function transection_id_update_process(Request $request)
    {
        /*check existance of current password start*/        
        $user = \DB::table('users')->where(['id' => \Auth::id(), 'trx_pin'=>$request->current_transection_id])->first();
        
        if($user)
        {
            $data = [
                'trx_pin' => $request->new_transection_id
            ];
            
            if(\DB::table('users')->where(['id' => \Auth::id(), 'trx_pin'=>$request->current_transection_id])->update($data))
            {
                set_msg('Password successfully changed!', 'success');
            }else{
                set_msg('Password not changed!', 'warning');
            }
        }else{
            set_msg('Current Password Is Not Matched!', 'warning');
        }
        /* check existance of current password end */

        return redirect()->back();
    }





    function ad_blance_to_main_balance()
    {
        $ads_income = \DB::table('ads_earning')->where(['user_id'=>\Auth::id()])->first();
        $balance    = \DB::table('balance')->where(['user_id'=>\Auth::id()])->first();
        if($ads_income)
        {
            $ads_balance = $ads_income->amount;

            if($balance)
            {
                $new_balance_data = [
                    'amount' => ($balance->amount+$ads_balance)
                ];
                if(\DB::table('balance')->where(['user_id'=>\Auth::id()])->update($new_balance_data))
                {
                    \DB::table('ads_earning')->where(['user_id'=>\Auth::id()])->update(['amount'=>0]);
                }
            }else{
                $balance_data = [
                    'user_id' => \Auth::id(),
                    'amount' => $ads_balance
                ];

                if(\DB::table('balance')->where(['user_id'=>\Auth::id()])->insert($balance_data))
                {
                    \DB::table('ads_earning')->where(['user_id'=>\Auth::id()])->update(['amount'=>0]);
                }
            }
        }

        return redirect()->back();
    }
}
