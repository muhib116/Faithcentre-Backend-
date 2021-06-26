<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Helper\File_helper;
use Illuminate\Support\Facades\DB;

class adcenterController extends Controller{
    public $data = [];   
    public function __construct() {
        $this->middleware('auth:web');
        
        $this->data['share_image']      = '';
        $this->data['meta_title']       = "Products";
        $this->data['meta_keyword']     = "this is meta keyword";
        $this->data['meta_description'] = "this is meta description";
    }


    public function video_ads()
    {
        $this->data['result'] = \DB::table('videos')->inRandomOrder()->get();
        return view('user_panel/pages/adcenter/video_ads')->with($this->data);
    }

    public function link_ads()
    {
        $this->data['result'] = \DB::table('link_ads')->inRandomOrder()->get();
        return view('user_panel/pages/adcenter/link_ads')->with($this->data);
    }

    public function link_ad_hit_count(Request $request)
    {
        $user_id  = \Auth::id();

        if(isset($_REQUEST['link_id']))
        {
            $ad_id = $request->link_id;

            /*check existance of same user hit start*/
            $old_ads_count = \DB::table('ads_hit_count')->where(['user_id'=>$user_id, 'ads_id'=>$ad_id, 'ads_type'=>'link'])->first();
            $old_ad        = \DB::table('link_ads')->where(['id'=>$ad_id])->first();

            if(!$old_ads_count && $old_ad)
            {
                $data = [
                    'date'      => date("Y-m-d"),
                    "time"      => date("H:i:s"),
                    'user_id'   => $user_id,
                    'ads_id'    => $ad_id,
                    'ads_type'  => 'link'
                ];

                if(\DB::table('ads_hit_count')->insert($data))
                {
                    // update hit count
                    $new_hit_count = ($old_ad->hit_count+1);
                    \DB::table('link_ads')->where(['id'=>$ad_id])->update(['hit_count'=>$new_hit_count]);

                    //work with ads earning
                    $this->add_ad_balance('link', $ad_id);
                    return 1;
                }else{
                    return 2;//some thing went wrong
                }
            }
            /*check existance of same user hit end*/
        }


        if(isset($_REQUEST['video_id']))
        {
            $ad_id = $request->video_id;

            /*check existance of same user hit start*/
            $old_ads_count = \DB::table('ads_hit_count')->where(['user_id'=>$user_id, 'ads_id'=>$ad_id, 'ads_type'=>'link'])->first();
            $old_ad        = \DB::table('videos')->where(['id'=>$ad_id])->first();

            if(!$old_ads_count && $old_ad)
            {
                $data = [
                    'date'      => date("Y-m-d"),
                    "time"      => date("H:i:s"),
                    'user_id'   => $user_id,
                    'ads_id'    => $ad_id,
                    'ads_type'  => 'video'
                ];

                if(\DB::table('ads_hit_count')->insert($data))
                {
                    // update hit count
                    $new_hit_count = ($old_ad->hit_count+1);
                    \DB::table('videos')->where(['id'=>$ad_id])->update(['hit_count'=>$new_hit_count]);

                    //work with ads earning
                    $this->add_ad_balance('video', $ad_id);
                    return 1;
                }else{
                    return 2;//some thing went wrong
                }
            }
            /*check existance of same user hit end*/
        }
        return 0;
    }






    private function add_ad_balance($ads_type, $ads_id)
    {
        // get the cpc of ad
        if($ads_type=='video')
        {
            $ads_info = \DB::table('videos')->where(['id'=>$ads_id])->first();
        }

        if($ads_type=='link')
        {
            $ads_info = \DB::table('link_ads')->where(['id'=>$ads_id])->first();
        }
        

        // chack user activated package
        if($package = \DB::table('package')->where(['user_id'=>\Auth::id()])->first())
        {
            /*get user package wise daily income limit start*/
            $daily_income_limit = 0;
            switch ($package->package_name) {
                case 'bronze':
                    $daily_income_limit = 1;//usd
                    break;
                case 'silver':
                    $daily_income_limit = 2;//usd
                    break;
                case 'gold':
                    $daily_income_limit = 5;//usd
                    break;
                
                default:
                    $daily_income_limit = 0;
                    break;
            }
            /*get user package wise daily income limit end*/
        

            // now add balance to the user acount
            // first check today income of user
            $today_total_ads_income = \DB::table('ads_earning_history')->where(['user_id'=>\Auth::id(), 'date'=>date('Y-m-d')])->sum('amount');
            
            if($today_total_ads_income>=0)
            {
                if($today_total_ads_income<$daily_income_limit)
                {
                    $ads_earning_history_data = [
                        'date'    => date("Y-m-d"),
                        'user_id' => \Auth::id(),
                        'amount'  => $ads_info->cpc
                    ];
                    \DB::table('ads_earning_history')->insert($ads_earning_history_data);

                    // get old ads earning and add new earning start
                        $old_ads_earning = \DB::table('ads_earning')->where(['user_id'=>\Auth::id()])->first();
                        if($old_ads_earning)
                        {
                            $ads_earning = [
                                'amount' => ($old_ads_earning->amount+$ads_info->cpc)
                            ];
                            \DB::table('ads_earning')->where(['user_id'=>\Auth::id()])->update($ads_earning);
                        }else{
                            $ads_earning = [
                                'user_id' => \Auth::id(),
                                'amount'  => $ads_info->cpc
                            ];
                            \DB::table('ads_earning')->insert($ads_earning);
                        }
                    // get old ads earning and add new earning end
                }
            }
        }
    }
}
