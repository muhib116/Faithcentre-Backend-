<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Helper\File_helper;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller{
    
    public function index(Request $request)
    {
        $password               = $request->password;
        $confirm_password       = $request->confirm_password;
        $transection_id         = $request->transection_id;
        $confirm_transection_id = $request->confirm_transection_id;

        if($password !== $confirm_password){
            set_msg('Password and Confirm Password Not Matched !', 'warning');
            return redirect()->back();
        }

        if($transection_id !== $confirm_transection_id){
            set_msg('Password and Confirm Password Not Matched !', 'warning');
            return redirect()->back();
        }

        $request->validate([
            'sponsore_id' => 'required',
            'name'        => 'required',
            'transection_id' => 'required',
            'email'       => 'required|unique:users',
            'phone'       => 'required|unique:users',
        ]);

        $sponsore_id = $request->sponsore_id;
        $data = [
            'created_at'  => date("Y-m-d H:i:s"),
            'updated_at'  => date("Y-m-d H:i:s"),
            'sponsore_id' => $sponsore_id,
            'name'        => $request->name,
            'email'       => $request->email,
            'phone'       => $request->phone,
            'trx_pin'     => $request->transection_id,
            'user_id'     => time(),
            'password'    => Hash::make($password)
        ];

        if($new_registered_user_id = DB::table('users')->insertGetId($data))
        {
            // work with refferal comission start
            $this->calculate_refferal_comission($sponsore_id, $new_registered_user_id);
            // work with refferal comission end

            set_msg('Resitration Completed Successfully !<br>Please Login Here.', 'success');
            return redirect()->route('user.login');
        }else{
            set_msg('Resitration Not Completed !', 'warning');
        }
        return redirect()->back();
        /*check user's otp_code matched with database and not expired end*/
    }


    /*registration refferal bonus processing start*/
        function calculate_refferal_comission($sponsore_id, $new_registered_user_id)
        {
            // get user according to sponsore_id start
            $level_one_user = \DB::table('users')->where(['user_id'=>$sponsore_id])->first();
            if($level_one_user)
            {
                /*level one refferal start*/
                    $level_one_refferal_bonus_data = [
                        'id_of_referral_code_owner'   => $level_one_user->id,
                        'date'                        => date('Y-m-d'),
                        'time'                        => date('H:i:s'),
                        'bonus_amount'                => 2,
                        'id_of_who_use_refferal_code' => $new_registered_user_id,
                    ];
                    \DB::table('refferal_bonus')->insert($level_one_refferal_bonus_data);
                /*level one refferal end*/



                /*level two refferal start*/
                    $level_two_user = \DB::table('users')->where(['user_id'=>$level_one_user->sponsore_id])->first();
                    if($level_two_user)
                    {
                        $level_two_refferal_bonus_data = [
                            'id_of_referral_code_owner'   => $level_two_user->id,
                            'date'                        => date('Y-m-d'),
                            'time'                        => date('H:i:s'),
                            'bonus_amount'                => 1,
                            'id_of_who_use_refferal_code' => $level_one_user->id,
                        ];
                        \DB::table('refferal_bonus')->insert($level_two_refferal_bonus_data);
                    }
                /*level two refferal end*/
            }
        }
    /*registration refferal bonus processing end*/
}
