<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Helper\File_helper;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class addFundController extends Controller{
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

        return view('user_panel/pages/addFund')->with($this->data);
    }


    public function add_fund_process(Request $request)
    {
        $recharge_history_data = [
            "date"          => date('Y-m-d'),
            "time"          => date('H:i:s'),
            "user_id"       => \Auth::id(),
            "amount"        => $request->amount,
            "trx_id"        => $request->trx_id,
            "payment_getway"=> 'btc'
        ];
        
        if(\DB::table('recharge_history')->insert($recharge_history_data))
        {
            set_msg("Add Fund Request Submited Successfully! <br> And Waiting For Admin Verification.", 'success');
        }else{
            set_msg("Add Fund Request Not Submited!", 'warning');
        }

        return redirect()->back();
    }
}
