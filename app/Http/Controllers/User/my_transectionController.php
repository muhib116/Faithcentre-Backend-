<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Helper\File_helper;
use Illuminate\Support\Facades\DB;

class my_transectionController extends Controller{
    public $data = [];   
    public function __construct() {
        $this->middleware('auth:web');
        
        $this->data['share_image']      = '';
        $this->data['meta_title']       = "Products";
        $this->data['meta_keyword']     = "this is meta keyword";
        $this->data['meta_description'] = "this is meta description";
    }


    public function balance_withdraw()
    {
        $this->data['share_image']      = '';
        $this->data['meta_title']       = "Blance Withdraw";
        $this->data['meta_keyword']     = "";
        $this->data['meta_description'] = "";

        return view('user_panel/pages/mytransection/balance_withdraw')->with($this->data);
    }

    function balance_withdraw_process(Request $request)
    {
        $withdrawable_balance = $request->withdrawable_balance;
        $amount_to_widthdraw  = $request->amount_to_widthdraw;
        $withdraw_type        = $request->withdraw_type;
        $wallet_address       = $request->wallet_address;

        // get prev balance of user
        $prev_balance = \DB::table('balance')->where(['user_id'=>\Auth::id()])->first();
        if($prev_balance)
        {
            $prev_balance = $prev_balance->amount;

            $new_balance_data = [
                'amount' => ($prev_balance - $amount_to_widthdraw)
            ];

            if(\DB::table('balance')->where(['user_id'=>\Auth::id()])->update($new_balance_data))
            {
                $withdraw_history = [
                    'user_id'         => \Auth::id(),
                    'date'            => date('Y-m-d'),
                    'time'            => date('H:i:s'),
                    'withdraw_amount' => $amount_to_widthdraw,
                    'withdraw_type'   => $withdraw_type,
                    'wallet_address'  => $wallet_address
                ];
                
                \DB::table('withdraw_history')->insert($withdraw_history);
                set_msg('Your withdraw request submited successfully!', 'successfully');
            }else{
                set_msg('Something went wrong!', 'warning');
            }
        }else{
            set_msg('You are not eligible for this request!', 'danger');
        }

        return redirect()->back();
    }



    public function balance_transfer()
    {
        $this->data['share_image']      = '';
        $this->data['meta_title']       = "Blance Transfer";
        $this->data['meta_keyword']     = "";
        $this->data['meta_description'] = "";

        return view('user_panel/pages/mytransection/balance_transfer')->with($this->data);
    }

    function balance_transfer_process(Request $request)
    {
        dd($request);
    }



    function refferal_balance()
    {
        $this->data['result'] = \DB::table('refferal_bonus')->where(['id_of_referral_code_owner'=>\Auth::id()])->get();
        return view('user_panel/pages/mytransection/refferal_balance')->with($this->data);
    }

    function refferal_balance_to_main_balance($id)
    {
        $refferal_bonus = \DB::table('refferal_bonus')->where(['activation_status'=>1, 'id'=>$id, 'id_of_referral_code_owner'=>\Auth::id()])->first();
        $old_balance    = \DB::table('balance')->where(['user_id'=>\Auth::id()])->first();

        if($refferal_bonus && $old_balance)
        {
            $new_balance_data = ['amount'=>($old_balance->amount+$refferal_bonus->bonus_amount)];

            if(\DB::table('balance')->where(['user_id'=>\Auth::id()])->update($new_balance_data))
            {
                $refferal_data = [
                    'date'                => date('Y-m-d'),
                    'time'                => date('H:i:s'),
                    'main_balance_status' => 1
                ];

                \DB::table('refferal_bonus')->where(['id'=>$id, 'id_of_referral_code_owner'=>\Auth::id()])->update($refferal_data);
                set_msg('Your Referral Bonus Added To Main Balance!', 'success');
            }else
            {
                set_msg('Your Referral Bonus Not Added To Main Balance!', 'warning');
            }
        }else
        {
            set_msg('Something went wrong !');
        }

        return redirect()->back();
    }
}
