<?php
    namespace App\Http\Controllers\Admin\Category;

    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use App\Helper\File_helper;
    use Illuminate\Support\Facades\DB;

    class categoryController extends Controller{
        public $data = [];
        public function __construct() {
            $this->middleware('auth:admin_logins');

            $this->data['meta_keyword']     = "";
            $this->data['meta_description'] = "";
        }

        /*all image in category start ___________________________________*/
        public function index()
        {
            $this->data['rows'] = DB::table('categories')
                                  ->where([
                                        'status'=>1
                                    ])
                                  ->get();

            return view('backend.pages.category.all')->with($this->data);
        }
        /*all image in category end _____________________________________*/


        /*add new image in category start ___________________________________*/
        public function create(){
            return view('backend.pages.category.new')->with($this->data);
        }
        /*add new image in category end _____________________________________*/



        /*save category image to database start _____________________________________*/
        public function store(Request $request){
            $request->validate([
                'name' => 'required|unique:categories|max:191',
            ]);
            $img_name     = time();

            // image upload process start------------
            $this->create_image($request->logo_img, $img_name, $request->logo_img_width, $request->logo_img_height, 200, 'logo/m', 70);
            $this->create_image($request->logo_img, $img_name, $request->logo_img_width, $request->logo_img_height, 400, 'logo/l', 70);
            $logo_image_name = $this->create_image($request->logo_img, $img_name, $request->logo_img_width, $request->logo_img_height, 950, 'logo/xl', 70);
            
            $banner_img_name = $this->create_image($request->banner_img, $img_name, $request->banner_img_width, $request->banner_img_height, 1200, 'banner', 70);
            // image upload process end--------------
            

            $data = [
                'created_at'  =>date("Y-m-d H:i:s"),
                'updated_at'  =>date("Y-m-d H:i:s"),
                'uploader_id' => \Auth::id(),
                'name'        => str_filter($request->name),
                'sounds_like' => metaphone($request->name),
                'logo_name'   => $logo_image_name.".webp",
                'banner_name' => $banner_img_name.".webp"
            ];
            

            /*now insert data into database*/
            if(DB::table('categories')->insert($data)){
                set_msg("Category Information Uploaded Successfully !", 'success');
            }else{
                set_msg("Category Information Not Uploaded !", 'warning');
            }
            return redirect()->back();
        }
        /*save category image to database end _____________________________________*/



        /*category image update start ________________________________________________*/
        public function edit($id)
        {
            $this->data['result'] = DB::table('categories')->where(['id'=>$id])->first();
            return view('backend.pages.category.edit')->with($this->data);
        }
        /*category image update end ________________________________________________*/



        /*category image update processing start ________________________________________________*/
        public function edit_process(Request $request, $id){
            $request->validate([
                'name' => 'required|max:191'
            ]);

            $data = [
                'updated_at'  =>date("Y-m-d H:i:s"),
                'uploader_id' => \Auth::id(),
                'name'        => str_filter($request->name),
                'sounds_like' => metaphone($request->name)
            ];


            $img_name     = time();

            // image upload process start------------
           if(!empty($request->logo_img))
            {
                $this->create_image($request->logo_img, $img_name, $request->logo_img_width, $request->logo_img_height, 200, 'logo/m', 70);
                $this->create_image($request->logo_img, $img_name, $request->logo_img_width, $request->logo_img_height, 400, 'logo/l', 70);
                $logo_image_name   = $this->create_image($request->logo_img, $img_name, $request->logo_img_width, $request->logo_img_height, 950, 'logo/xl', 70);
                $data['logo_name'] = $logo_image_name.".webp";
            }
            if(!empty($request->banner_img))
            {
                $banner_img_name     = $this->create_image($request->banner_img, $img_name, $request->banner_img_width, $request->banner_img_height, 1200, 'banner', 70);
                $data['banner_name'] = $banner_img_name.".webp";
            }
            // image upload process end--------------


            $existance = DB::table('categories')
                         ->where([['id', '!=', $id],['name', '=', $request->name]])
                         ->first();

            if($existance==true){
                set_msg('Name Already Taken !','danger');
                return redirect()->back();
            }

            
            /*now update data into database*/
            if(DB::table('categories')->where(['id'=>$id])->update($data)){
                // delete old logo and banner start-----------------
                if(!empty($request->logo_img))
                {
                    if(file_exists('public/backend/images/category/logo/m/'.$request->old_logo_img_path)){
                        unlink('public/backend/images/category/logo/m/'.$request->old_logo_img_path);
                    }
                    if(file_exists('public/backend/images/category/logo/l/'.$request->old_logo_img_path)){
                        unlink('public/backend/images/category/logo/l/'.$request->old_logo_img_path);
                    }
                    if(file_exists('public/backend/images/category/logo/xl/'.$request->old_logo_img_path)){
                        unlink('public/backend/images/category/logo/xl/'.$request->old_logo_img_path);
                    }
                }
                // delete old logo and banner start-----------------
                if(!empty($request->banner_img))
                {
                    if(file_exists('public/backend/images/category/banner/'.$request->old_banner_img_path)){
                        unlink('public/backend/images/category/banner/'.$request->old_banner_img_path);
                    }
                }
                // delete old logo and banner end-------------------

                set_msg("Category Information Updated Successfully !", 'success');
            }else{
                set_msg("Category Information Not Updated !", 'warning');
            }

            return redirect()->back();
        }
        /*category image update processing end ________________________________________________*/


        /*category image in trash start ________________________________________________*/
        public function trash_list()
        {
            $this->data['rows'] = DB::table('categories')
                                  ->where([
                                        'status'=>0
                                    ])
                                  ->get();
            
            return view('backend.pages.category.trash')->with($this->data);
        }
        /*category image in trash end ________________________________________________*/



        /*category image trash processing start ________________________________________________*/
        public function trash(Request $request,$id){
            $delete_status = DB::table('categories')
                             ->where(['id'=>$id])
                             ->update(['status'=>0]);

            if($delete_status){
                set_msg("Category Image Sent To Trash Successfully !", 'success');
            }else{
                set_msg("Category Image Not Sent To Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*category image trash processing end ________________________________________________*/



        /*category image restore processing start ________________________________________________*/
        public function restore(Request $request,$id){
            $delete_status = DB::table('categories')
                             ->where(['id'=>$id])
                             ->update(['status'=>1]);
            
            if($delete_status){
                set_msg("Category Image Restore From Trash Successfully !", 'success');
            }else{
                set_msg("Category Image Not Restore From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*category image restore processing end ________________________________________________*/



        /*category image delete processing start ________________________________________________*/
        public function delete(Request $request,$id){
            $old_data      = DB::table('categories')
                                ->where(['id'=>$id])
                                ->first();

            $delete_status = DB::table('categories')
                             ->where(['id'=>$id])
                             ->delete();
            
            if($delete_status){
                // unlink all logo and banner of this subcategory start------------
                if(file_exists('public/backend/images/category/logo/m/'.$old_data->logo_name)){
                    unlink('public/backend/images/category/logo/m/'.$old_data->logo_name);
                }
                if(file_exists('public/backend/images/category/logo/l/'.$old_data->logo_name)){
                    unlink('public/backend/images/category/logo/l/'.$old_data->logo_name);
                }
                if(file_exists('public/backend/images/category/logo/xl/'.$old_data->logo_name)){
                    unlink('public/backend/images/category/logo/xl/'.$old_data->logo_name);
                }

                if(file_exists('public/backend/images/category/banner/'.$old_data->banner_name)){
                    unlink('public/backend/images/category/banner/'.$old_data->banner_name);
                }
                // unlink all logo and banner of this subcategory end--------------
                
                set_msg("Category Permanently Deleted From Trash Successfully !", 'success');
            }else{
                set_msg("Category Not Permanently Deleted From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*category image delete processing end ________________________________________________*/



        

        private function create_image($image, $img_name, $prev_width, $prev_height, $new_width, $folder, $quality){
            if(!empty($image)){
                $base64_img = base64_decode($image);
                $base64_img = explode(',', $base64_img)[1];
                $base64_img = str_replace(' ', '+', $base64_img);            

                $image      = base64_decode($base64_img);
                
                $img_location = "public/backend/images/category/";
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
    }