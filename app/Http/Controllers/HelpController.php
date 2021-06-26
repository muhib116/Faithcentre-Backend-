<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HelpController extends Controller{
    public $data = [];
    public function __construct() {}

    public function about_us(){
        $this->data['share_image']      = '';
        $this->data['meta_title']       = "About Us";
        $this->data['meta_keyword']     = "this is meta keyword";
        $this->data['meta_description'] = "this is meta description";


        return view('frontend/pages/about_us')->with($this->data);
    }

    public function contact_us_process(Request $request){
        $data = [
            "date"    => date('Y-m-d'),
            "time"    => date('H:i:s'),
            "name"    => $request->name,
            "subject" => $request->subject,
            "email"   => $request->email,
            "phone"   => $request->phone,
            "details" => $request->details
        ];

        if(\DB::table('contact_us')->insert($data))
        {
            set_msg('Your contact request submitted successfully!', 'success');
        }else{
            set_msg('Your contact request not submitted!', 'danger');
        }

        return redirect()->back();
    }

    public function services(){
        $this->data['share_image']      = '';
        $this->data['meta_title']       = "Services";
        $this->data['meta_keyword']     = "this is meta keyword";
        $this->data['meta_description'] = "this is meta description";

        return view('frontend/pages/services')->with($this->data);
    }


    // this method from registration from start-------
    public function matched_sponsored_id_by_ajax()
    {
        $key = $_REQUEST['key'];

        if(isset($key) && (!empty($key) || $key))
        {
            if(\DB::table('users')->where(['user_id'=>$key])->first())
            {
                return 1;
            }else{
                return 0;
            }
        }else{
            return 0;
        }
    }
    // this method from registration from end---------
}
