<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AjaxController extends Controller{
    public $data = [];
    public function __construct() {}


    function get_district(){
        $division_id  = $_GET['division_id'];
        $get_district = \DB::table("districts")->select('id','name')->where(['division_id'=>$division_id])->get();

        if($get_district){
            echo json_encode($get_district);
        }else{
            echo 0;
        }
    }


    function get_upazila(){
        $district_id  = $_GET['district_id'];
        $get_upazila = \DB::table("upazilas")->select('id','name')->where(['district_id'=>$district_id])->get();

        if($get_upazila){
            echo json_encode($get_upazila);
        }else{
            echo 0;
        }
    }
}
