<?php
    namespace App\Http\Controllers\Admin\News;

    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use App\Helper\File_helper;
    use Illuminate\Support\Facades\DB;

    class newsController extends Controller{
        public $data = [];
        public function __construct() {
            $this->middleware('auth:admin_logins');

            $this->data['meta_keyword']     = "";
            $this->data['meta_description'] = "";

            $this->data['category']    = \DB::table('categories')->where(['status'=>1])->get();
        }

        /*all image in news start ___________________________________*/
        public function index()
        {
            $this->data['rows'] = DB::table('news')
                                    ->leftJoin('categories', 'news.category_id', 'categories.id')
                                    ->leftJoin('subcategories', 'news.subcategory_id', 'subcategories.id')
                                    ->select(
                                        'news.*',
                                        'categories.name as category',
                                        'subcategories.name as subcategory'
                                    )
                                    ->where([
                                        'news.status'=>1
                                    ])
                                    ->orderby('news.id', 'desc')
                                  ->get();

            return view('backend.pages.news.all')->with($this->data);
        }
        /*all image in news end _____________________________________*/


        /*add new image in news start ___________________________________*/
        public function create(){
            return view('backend.pages.news.new')->with($this->data);
        }
        /*add new image in news end _____________________________________*/



        /*save news image to database start _____________________________________*/
        public function store(Request $request)
        {
            $data = [
                'date'            =>$request->date,
                'created_at'      =>date("Y-m-d H:i:s"),
                'updated_at'      =>date("Y-m-d H:i:s"),
                'uploader_id'     => \Auth::id(),
                'category_id'     => $request->category_id,
                'subcategory_id'  => $request->subcategory_id,
                'publisher'       => $request->publisher,
                'post_type'       => $request->post_type,
                'title'           => str_filter($request->title),
                'slug'            => $request->slug,
                'description'     => $request->details,
                'meta_tag'        => $request->meta_tag,
                'meta_description'=> $request->meta_description,
                'status'          => (($request->status == null) ? 0 : $request->status)
            ];

            if(isset($request->video))
            {
                $video = $request->video;
                $video = explode('&', $video)[0];
                $video = explode('?v=', $video);

                if(count($video)>1)
                {
                    $video = $video[1];
                }else{
                    $video = $video[0];
                }
                
                $data['video'] = $video;
            }

            if(isset($request->banner_img) && !empty($request->banner_img))
            {
                $img_name = time();
                // image upload process start------------
                $this->create_image($request->banner_img, $img_name, $request->banner_img_width, $request->banner_img_height, 300, 'm', 70);
                $this->create_image($request->banner_img, $img_name, $request->banner_img_width, $request->banner_img_height, 600, 'l', 70);
                $banner_img_name = $this->create_image($request->banner_img, $img_name, $request->banner_img_width, $request->banner_img_height, 1200, 'xl', 80);
                
                // image upload process end--------------
                $data['banner_img_name'] = $banner_img_name.".webp";
                $data['image_caption']   = $request->image_caption;
            }


            /*now insert data into database*/
            if(DB::table('news')->insert($data))
            {
                set_msg("News Information Uploaded Successfully !", 'success');
            }else{
                set_msg("News Information Not Uploaded !", 'warning');
            }
            return redirect()->back();
        }
        /*save news image to database end _____________________________________*/



        /*news image update start ________________________________________________*/
        public function edit($id){
            // this id pass for delete single image
            $this->data['id'] = $id;

            $this->data['result'] = DB::table('news')
                                    ->leftJoin('categories', 'news.category_id', 'categories.id')
                                    ->leftJoin('subcategories', 'news.subcategory_id', 'subcategories.id')
                                    ->select(
                                        'news.*',
                                        'categories.name as category',
                                        'subcategories.name as subcategory'
                                    )
                                    ->where([
                                        'news.id'=>$id,
                                        'news.status'=>1
                                    ])
                                    ->orderby('news.id', 'desc')
                                  ->first();

            return view('backend.pages.news.edit')->with($this->data);
        }
        /*news image update end ________________________________________________*/



        /*news image update processing start ________________________________________________*/
        public function edit_process(Request $request, $id)
        {   

            $data = [
                'date'            =>$request->date,
                'updated_at'      =>date("Y-m-d H:i:s"),
                'uploader_id'     => \Auth::id(),
                'category_id'     => $request->category_id,
                'subcategory_id'  => $request->subcategory_id,
                'publisher'       => $request->publisher,
                'post_type'       => $request->post_type,
                'title'           => str_filter($request->title),
                'slug'            => $request->slug,
                'description'     => $request->details,
                'meta_tag'        => $request->meta_tag,
                'meta_description'=> $request->meta_description,
                'status'          => (($request->status == null) ? 0 : $request->status)
            ];


            if(isset($request->video))
            {
                $video = $request->video;
                $video = explode('&', $video)[0];
                $video = explode('?v=', $video);

                if(count($video)>1)
                {
                    $video = $video[1];
                }else{
                    $video = $video[0];
                }
                $data['video'] = $video;
            }else{
                $data['video'] = '';
            }


            // image upload process start------------
           if(isset($request->banner_img) && !empty($request->banner_img))
            {
                $img_name = time();
                // image upload process start------------
                $this->create_image($request->banner_img, $img_name, $request->banner_img_width, $request->banner_img_height, 300, 'm', 70);
                $this->create_image($request->banner_img, $img_name, $request->banner_img_width, $request->banner_img_height, 600, 'l', 70);
                $banner_img_name = $this->create_image($request->banner_img, $img_name, $request->banner_img_width, $request->banner_img_height, 1200, 'xl', 80);
                // image upload process end--------------
                $data['banner_img_name'] = $banner_img_name.".webp";
            }
            // image upload process end--------------


            $existance = DB::table('news')
                         ->where([['id', '!=', $id],['title', '=', $request->title]])
                         ->first();

            if($existance==true){
                set_msg('News Already Taken !','danger');
                return redirect()->back();
            }

            

            /*now update data into database*/
            if(DB::table('news')->where(['id'=>$id])->update($data)){
                // delete oldand banner start-----------------
                if(!empty($request->banner_img) && !empty($request->old_banner_path))
                {
                    if(file_exists('public/backend/images/news/m/'.$request->old_banner_path)){
                        unlink('public/backend/images/news/m/'.$request->old_banner_path);
                    }
                    if(file_exists('public/backend/images/news/l/'.$request->old_banner_path)){
                        unlink('public/backend/images/news/l/'.$request->old_banner_path);
                    }
                    if(file_exists('public/backend/images/news/xl/'.$request->old_banner_path)){
                        unlink('public/backend/images/news/xl/'.$request->old_banner_path);
                    }
                }

                set_msg("News Information Updated Successfully !", 'success');
            }else{
                set_msg("News Information Not Updated !", 'warning');
            }

            return redirect()->back();
        }
        /*news image update processing end ________________________________________________*/


        /*news image in trash start ________________________________________________*/
        public function trash_list()
        {
            $this->data['rows'] = DB::table('news')
                                    ->leftJoin('categories', 'news.category_id', 'categories.id')
                                    ->leftJoin('subcategories', 'news.subcategory_id', 'subcategories.id')
                                    ->select(
                                        'news.*',
                                        'categories.name as category',
                                        'subcategories.name as subcategory'
                                    )
                                    ->where([
                                        'news.status'=>0
                                    ])
                                    ->orderby('news.id', 'desc')
                                  ->get();
            
            return view('backend.pages.news.trash')->with($this->data);
        }
        /*news image in trash end ________________________________________________*/



        /*news image trash processing start ________________________________________________*/
        public function trash(Request $request,$id){
            $delete_status = DB::table('news')
                             ->where(['id'=>$id])
                             ->update(['status'=>0]);

            if($delete_status){
                set_msg("News data Sent To Trash Successfully !", 'success');
            }else{
                set_msg("News data Not Sent To Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*news image trash processing end ________________________________________________*/



        /*news image restore processing start ________________________________________________*/
        public function restore(Request $request,$id){
            $delete_status = DB::table('news')
                             ->where(['id'=>$id])
                             ->update(['status'=>1]);
            
            if($delete_status){
                set_msg("News data Restore From Trash Successfully !", 'success');
            }else{
                set_msg("News data Not Restore From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*news image restore processing end ________________________________________________*/



        /*news image delete processing start ________________________________________________*/
        public function delete(Request $request,$id){
            $old_data      = DB::table('news')
                                ->where(['id'=>$id])
                                ->first();

            $delete_status = DB::table('news')
                             ->where(['id'=>$id])
                             ->delete();
            
            if($delete_status){
                // unlink all logo and banner of this subnews start------------
                if(file_exists('public/backend/images/news/m/'.$old_data->banner_img_name)){
                    unlink('public/backend/images/news/m/'.$old_data->banner_img_name);
                }
                if(file_exists('public/backend/images/news/l/'.$old_data->banner_img_name)){
                    unlink('public/backend/images/news/l/'.$old_data->banner_img_name);
                }
                if(file_exists('public/backend/images/news/xl/'.$old_data->banner_img_name)){
                    unlink('public/backend/images/news/xl/'.$old_data->banner_img_name);
                }
                // unlink all logo and banner of this subnews end--------------
                
                set_msg("News Permanently Deleted From Trash Successfully !", 'success');
            }else{
                set_msg("News Not Permanently Deleted From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*news image delete processing end ________________________________________________*/



        

        private function create_image($image, $img_name, $prev_width, $prev_height, $new_width, $folder, $quality){
            if(!empty($image)){
                $base64_img = base64_decode($image);
                $base64_img = explode(',', $base64_img)[1];
                $base64_img = str_replace(' ', '+', $base64_img);            

                $image      = base64_decode($base64_img);
                
                $img_location = "public/backend/images/news/";
                $img          = imagecreatefromstring($image);
                
                
                if($img){
                    // calculate image ratio start----------------
                    list($new_width, $new_height) = $this->image_ratio($prev_width, $prev_height, $new_width);
                    // calculate image ratio end------------------
                    
                    $trueColor = imagecreatetruecolor($new_width, $new_height);
                    
                    // Set the background color of image using 
                    // imagecolorallocate() function. 
                    $bg = imagecolorallocate($trueColor, 255, 255, 255);
                    
                    // Fill background with above selected color.
                    imagefill($trueColor, 0, 0, $bg);
                    
                    // copy image to this 
                    imagecopyresampled($trueColor, $img, 0, 0, 0, 0, $new_width, $new_height, $prev_width, $prev_height);
                    
                    // now create a webp formated imge to specific location
                    imagewebp($trueColor, $img_location.$folder."/".$img_name.".webp", $quality);

                    // free memory
                    imagedestroy($trueColor); 
                }
                return $img_name;
            }else{
                return null;
            }

        }


        private function image_ratio($prev_width, $prev_height,$new_width){
            return [$new_width, (($prev_height/$prev_width)*$new_width)];
        }

        function getsubcategoryByAjaxForNews()
        {
            $id = $_GET['category_id'];
            $sub_category = \DB::table('subcategories')
                            ->select('name','id')
                            ->where(['status'=>1, 'category_id'=>$id])
                            ->get();

            if(count($sub_category)>0){
                echo json_encode($sub_category);
            }else{
                echo 0;
            }
        }
    }