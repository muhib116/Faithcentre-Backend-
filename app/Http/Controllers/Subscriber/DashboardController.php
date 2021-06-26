<?php

namespace App\Http\Controllers\Subscriber;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DashboardController extends Controller{
    public $data = [];
    public function __construct() {
        $this->middleware('auth:subscriber_logins');

        $this->data['nav']              = '';//active the nav menue (id name of nav items)
        $this->data['aside']            = 'dashboard';//active the aside menue (id name of aside items)
        $this->data['meta_keyword']     = "Deshboard,iT,Bongobondhu iT";//set meta keyword
        $this->data['meta_description'] = "This is an international iT company.";//set meta description
    }

    public function index() {
        $this->data['asideDropdown'] = 'all';//active the aside dropdown

    	return view('subscriber.pages.dashboard')->with($this->data);
    }
}
