<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductsController extends Controller{
    public $data = [];
    public function __construct() {}

    public function index(){
        $this->data['share_image']      = '';
        $this->data['meta_title']       = "Products";
        $this->data['meta_keyword']     = "this is meta keyword";
        $this->data['meta_description'] = "this is meta description";
        return view('frontend/pages/products/products')->with($this->data);
    }

    public function single_product(){
        $this->data['share_image']      = '';
        $this->data['meta_title']       = 'Product Not Found';
        $this->data['meta_keyword']     = "topten,onnorokomshop,ecommerce";
        $this->data['meta_description'] = 'topten.com.bd and onnorokomshop.com are online shopping mall';


        $url_query = $_GET['inf'];
        $url_query = json_decode(base64_decode($url_query), true);


        if($url_query){
            $this->data['product_code']    = $product_code = $url_query['product_code'];
            $this->data['sku_id']          = $sku_id       = $url_query['sku_id'];
            
            $this->data['delivery_charge'] = \DB::table('product_additional_information')->where(['product_code'=>$product_code])->first()->delivery_charge;


            $this->data["product"] = \DB::table('product_primary_information as ppi')
                                    ->leftJoin('shop_information as si', 'si.id', '=', 'ppi.shop_id')
                                    ->leftJoin('brands', 'brands.id', '=', 'ppi.brand_id')
                                    ->leftJoin('product_additional_information as pai', 'pai.product_code', '=', 'ppi.product_code')
                                    ->leftJoin('product_sku as ps', 'ps.product_code', '=', 'ppi.product_code')
                                    ->select(
                                        'ppi.*',
                                        'si.name as shop_name',
                                        'brands.name as brand_name',
                                        'pai.*',
                                        'ps.price',
                                        'ps.special_price',
                                        'ps.from_date',
                                        'ps.to_date',
                                    )
                                    ->where([
                                        'ppi.product_code'=>$product_code,
                                        'ps.id'=>$sku_id
                                    ])
                                    ->first();


            if($product = $this->data["product"]){
                /*meta information configaration start------------------------------*/
                    // get image for share to social media start
                     $img = \DB::table('product_img_color')
                            ->where([
                                'product_code'    =>$product_code,
                                'main_img_status' =>1,
                                'status'          =>1
                            ])
                            ->select('img_name')
                            ->first();
                    $img = asset("public/frontend/images/products/500x500/$img->img_name");
                    // get image for share to social media end

                    $this->data['share_image']      = $img;
                    $this->data['meta_title']       = $product->name;
                    $this->data['meta_keyword']     = $product->meta_keyword;
                    $this->data['meta_description'] = $product->name;
                /*meta information configaration end--------------------------------*/


                /*review calculation start--------------------------------------------*/
                $review = \DB::table('product_review')
                               ->where([
                                    'product_code' => $product_code,
                                    'status'       => 1
                                ])
                               ->select('product_review')
                               ->get();

                if(count($review)>0){
                    $this->data['review_recored_quantity'] = count($review);
                    
                    /*avarage review start*/
                    $total_review = 0;
                    foreach ($review as $key => $value) {
                        $total_review += $value->product_review;
                    }
                    $this->data['average_review'] = ($total_review/count($review));
                    /*avarage review end*/
                }
                /*review calculation end----------------------------------------------*/


                /*single sku information start------------------------------------------*/
                $product_single_sku_info = 
                                    \DB::table('product_sku')
                                    ->select(
                                        'product_sku.availability as availability',
                                        'product_sku.product_size as product_size',
                                        'product_sku.quantity as quantity',
                                        'product_sku.color_id as color_id'
                                    )
                                    ->where([
                                        'id'=>$sku_id,
                                        'product_code'=>$product_code,
                                        'main_recored_status'=>1
                                    ])
                                    ->first();
                
                /*single sku information end--------------------------------------------*/

                /*selected product's img and color start--------------------------------*/
                $this->data["product_img_color"] = \DB::table('product_img_color as pic')
                                    ->where([
                                        'pic.product_code' => $product_code,
                                        'pic.status'       => 1,
                                        'pic.color_id'     => $product_single_sku_info->color_id
                                    ])
                                    ->select('img_name', 'main_img_status', 'color_id')
                                    ->orderBy('pic.main_img_status', 'DESC')
                                    ->get();
                /*selected product's img and color end--------------------------------*/


                /*product sizes start---------------------------------------------------*/
                $this->data['product_size_for_selected_product'] = $product_single_sku_info->product_size;
                $this->data['product_size'] = \DB::table("product_sku")
                                            ->where([
                                                "product_code"  => $product_code,
                                                "color_id"      => $product_single_sku_info->color_id,
                                            ])
                                            ->select(
                                                'id',
                                                'product_size',
                                                'quantity',
                                                "price",
                                                "special_price",
                                                "from_date",
                                                "to_date"
                                            )
                                            ->get();
                /*product sizes end-----------------------------------------------------*/


                /*product color family start---------------------------------------------------*/
                $this->data['product_color_id_for_selected_product'] = $product_single_sku_info->color_id;
                $this->data['product_color_family'] = \DB::table("product_img_color")
                                                        ->where([
                                                            "product_code" => $product_code,
                                                            "status"       => 1
                                                        ])
                                                        ->orderBy('main_img_status', 'DESC')
                                                        ->select('img_name', 'color_id','color_id')
                                                        ->get()
                                                        ->groupBy('color_id');
                /*product color family end-----------------------------------------------------*/
            }else{
                return view('frontend/pages/products/product_not_available');
            }

            return view('frontend/pages/products/single_product')->with($this->data);
        }else{
            return view('frontend/pages/products/product_not_available');
        }

    }







    // ajax request start --------------------------------------------------------
    public function read_popular_product_by_ajax(){
        $offset = $_POST['offset'];
        $limit  = $_POST['limit'];
        
        $popular_product = \DB::table('product_primary_information as ppi')
                        ->leftJoin('product_img_color as pic', 'ppi.product_code', '=', 'pic.product_code')
                        ->leftJoin('product_sku as ps', 'ppi.product_code', '=', 'ps.product_code')
                        ->orderBy('ppi.sale_count', 'DESC')
                        ->select(
                            'ppi.product_code',
                            'ppi.name as product_name',
                            'ppi.sale_count as sale_count',
                            
                            'pic.img_name',

                            'ps.id as sku_id',
                            'ps.product_size as product_size',
                            'ps.price as price',
                            'ps.special_price as special_price',
                            'ps.from_date as from_date',
                            'ps.to_date as to_date'
                        )
                        ->where([
                            'ppi.status'             => 1,
                            'pic.main_img_status'    => 1,
                            'ps.main_recored_status' => 1
                        ])
                        ->offset($offset)
                        ->limit($limit)
                        ->get();

        /*calculate product review start*/
        foreach($popular_product as $key => $value){
                $product_code = $value->product_code;
                $review       = \DB::table("product_review")
                                ->where(["product_code"=>$product_code])
                                ->get();
            /* calculate product review end */

            /* sale count and review start */
            if(count($review)>0){
                $review_sum = 0;
                for($i=0; $i<count($review); $i++){
                    $review_sum += $review[$i]->product_review;
                }
                $avarage = $review_sum/count($review);
                $avarage = ($avarage>=5) ? 5 : $avarage;

                /*push review quantity and avarage review to $popular_product array start*/
                $popular_product[$key]->total_review = count($review);
                $popular_product[$key]->avarage      = $avarage;
                /*push review quantity and avarage review to $popular_product array end*/
            }
        }
        /* sale count and review end */

        if($popular_product){
            echo json_encode($popular_product);
        }else{
            echo '[]';
        }
    }


    public function read_sku_by_ajax_for_color_family(){
        $product_code = $_POST['product_code'];
        $color_id     = $_POST['color_id'];

        $img_info = \DB::table('product_img_color as pic')
                    ->select(
                        'pic.img_name',
                        'pic.main_img_status'
                    )
                    ->where([
                        'pic.product_code' => $product_code,
                        'pic.color_id'     => $color_id,
                        'pic.status'       => 1
                    ])
                    ->get();

        $sku_info    = \DB::table('product_sku as ps')
                        ->select(
                            'ps.id',
                            'ps.product_size',
                            'ps.quantity',
                            'ps.price',
                            'ps.special_price',
                            'ps.from_date',
                            'ps.to_date'
                        )
                        ->where([
                            'ps.product_code' => $product_code,
                            'ps.color_id'     => $color_id
                        ])
                        ->get();

        $color_family_wise_information = [$img_info,$sku_info];

        if(count($color_family_wise_information)>0){
            echo json_encode($color_family_wise_information);
        }else{
            echo 0;
        }
    }
    // ajax request end ----------------------------------------------------------
}
