<?php

namespace App\Http\Controllers\API;

use App\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;

class homeController extends Controller
{
    function get_section($section_name=false)
    {
        $cond = ["status" => 1];

        if($section_name)
        {
            $cond['section_name'] = $section_name;
        }

        $result = \DB::table('page_sections')
                    ->select(
                        'id',
                        'section_name',
                        'title',
                        'slug',
                        'short_detail',
                        'detail',
                        'note',
                        'image_name'
                    )
                    ->where($cond)
                    ->get();

        if(count($result))
        {
            foreach ($result as $key => $value)
            {
                $value->img_path = asset("public/backend/images/page_section");
                $value->strip_short_detail = strip_tags($value->short_detail);

                $meta_data = \DB::table('page_section_meta')
                                    ->select(
                                        'meta_key as title',
                                        'meta_key as value'
                                    )
                                    ->where([
                                        'section_id' => $value->id
                                    ])->get();

                if(count($meta_data))
                {
                    $value->meta_data = $meta_data;
                }else{
                    $value->meta_data = [];
                }
            }

            return  $result->toJson();
        }else{
            return json_encode([]);
        }
    }


    function get_customer_feedback_data()
    {
        $cond = ["status" => 1];

        $result = \DB::table('customer_feedbacks')->where($cond)->get();

        if(count($result))
        {
            foreach ($result as $key => $value)
            {
                $value->img_path = asset("public/backend/img/customer_feedback");
            }

            return  $result->toJson();
        }else{
            return json_encode([]);
        }
    }


    function get_cours_data()
    {
        $cond = ["status" => 1];

        $result = \DB::table('our_courses')->where($cond)->get();

        if(count($result))
        {
            foreach ($result as $key => $value)
            {
                $value->detail   = make_short(strip_tags($value->detail), 200);
                $value->img_path = asset("public/backend/images/cours");
            }

            return  $result->toJson();
        }else{
            return json_encode([]);
        }
    }
}
