<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Helper\File_helper;
use Illuminate\Support\Facades\DB;

class statementController extends Controller{
    public $data = [];   
    public function __construct() {
        $this->middleware('auth:web');
        
        $this->data['share_image']      = '';
        $this->data['meta_title']       = "Products";
        $this->data['meta_keyword']     = "this is meta keyword";
        $this->data['meta_description'] = "this is meta description";
    }


    public function notification_view()
    {
        $this->data['share_image']      = '';
        $this->data['meta_title']       = "Notification view";
        $this->data['meta_keyword']     = "";
        $this->data['meta_description'] = "";

        return view('user_panel/pages/statement/notification_view')->with($this->data);
    }

    public function transfered_report()
    {
        $this->data['share_image']      = '';
        $this->data['meta_title']       = "Transection report";
        $this->data['meta_keyword']     = "";
        $this->data['meta_description'] = "";

        return view('user_panel/pages/statement/transfered_report')->with($this->data);
    }

    public function withdraw_report()
    {
        $this->data['share_image']      = '';
        $this->data['meta_title']       = "Withdraw report";
        $this->data['meta_keyword']     = "";
        $this->data['meta_description'] = "";

        return view('user_panel/pages/statement/withdraw_report')->with($this->data);
    }

    public function received_report()
    {
        $this->data['share_image']      = '';
        $this->data['meta_title']       = "Received report";
        $this->data['meta_keyword']     = "";
        $this->data['meta_description'] = "";

        return view('user_panel/pages/statement/received_report')->with($this->data);
    }

    public function conversion_received_report()
    {
        $this->data['share_image']      = '';
        $this->data['meta_title']       = "Conversion received report";
        $this->data['meta_keyword']     = "";
        $this->data['meta_description'] = "";

        return view('user_panel/pages/statement/conversion_received_report')->with($this->data);
    }

    public function conversion_transfer_report()
    {
        $this->data['share_image']      = '';
        $this->data['meta_title']       = "Conversion transfer report";
        $this->data['meta_keyword']     = "";
        $this->data['meta_description'] = "";

        return view('user_panel/pages/statement/conversion_transfer_report')->with($this->data);
    }
}
