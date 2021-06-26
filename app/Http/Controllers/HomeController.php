<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller{
    public $data = [];
    public function __construct(){}

    public function index(){
        $this->data['share_image']      = '';
        $this->data['meta_title']       = "";
        $this->data['meta_keyword']     = "";
        $this->data['meta_description'] = "";

    	// read slider start----------
    	$this->data['slider'] = DB::table('sliders')
    							->where(['status'=>1])
    							->get();
    	// read slider end------------


        $this->data['categories']      = \DB::table('categories')->where(['status'=>1])->get();

        $this->data['last_three_news'] = \DB::table('news')
                                            ->leftJoin('categories', 'news.category_id', 'categories.id')
                                            ->select(
                                                'news.date',
                                                'news.category_id',
                                                'news.subcategory_id',
                                                'news.title',
                                                'news.slug',
                                                'news.description',
                                                'news.publisher',
                                                'news.post_type',
                                                'news.banner_img_name',
                                                'news.image_caption',
                                                'news.video',
                                                'categories.name as category_name'
                                            )
                                            ->where(['news.status'=>1])
                                            ->orderBy('news.id', 'desc')
                                            ->limit(3)->get();

        return view('frontend/pages/home')->with($this->data);
    }
}
