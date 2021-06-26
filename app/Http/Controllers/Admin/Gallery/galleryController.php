<?php
    namespace App\Http\Controllers\Admin\Gallery;

    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use App\Helper\File_helper;
    use Illuminate\Support\Facades\DB;

    class galleryController extends Controller{
        public $data = [];
        public function __construct() {
            $this->middleware('auth:admin_logins');

            $this->data['meta_keyword']     = "";
            $this->data['meta_description'] = "";
        }

        /*all image in gallery start ___________________________________*/
        public function index()
        {
            $this->data['rows'] = DB::table('galleries')
                                  ->where([
                                        'status'=>1
                                    ])
                                  ->get();

            return view('backend.pages.gallery.all')->with($this->data);
        }
        /*all image in gallery end _____________________________________*/


        /*add new image in gallery start ___________________________________*/
        public function create(){
            return view('backend.pages.gallery.new')->with($this->data);
        }
        /*add new image in gallery end _____________________________________*/



        /*save gallery image to database start _____________________________________*/
        public function store(Request $request)
        {
            $data = [
                'uploader_id' => \Auth::id(),
                "caption"     => $request->caption,
                "slug"        => $request->slug,
                "detail"      => $request->detail,
                'created_at'  => date("Y-m-d H:i:s"),
                'updated_at'  => date("Y-m-d H:i:s")
            ];

            if(isset($request->img) && !empty($request->img))
            {
                // image upload process start------------
                    $img_name = time();
                    $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 10, 's', 10);
                    $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 400, 'm', 70);
                    $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 600, 'l', 80);
                    $image_name = $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 1000, 'xl', 90);
                    
                    
                    $data['image_name'] = $image_name.".webp";
                // image upload process end--------------
            }
            
            

            /*now insert data into database*/
            if($section_id = \DB::table('galleries')->insertGetId($data))
            {
                set_msg("Gallery Information Uploaded Successfully !", 'success');
            }else{
                set_msg("Gallery Information Not Uploaded !", 'warning');
            }
            return redirect()->back();
        }
        /*save gallery image to database end _____________________________________*/



        /*gallery image update start ________________________________________________*/
        public function edit($id)
        {
            $this->data['result'] = DB::table('galleries')->where(['id'=>$id])->first();

            return view('backend.pages.gallery.edit')->with($this->data);
        }
        /*gallery image update end ________________________________________________*/



        /*gallery image update processing start ________________________________________________*/
        public function edit_process(Request $request, $id)
        {

            $data = [
                'uploader_id' => \Auth::id(),
                "caption"     => $request->caption,
                "slug"        => $request->slug,
                "detail"      => $request->detail,
                'created_at'  => date("Y-m-d H:i:s"),
                'updated_at'  => date("Y-m-d H:i:s")
            ];

            if(isset($request->img) && !empty($request->img))
            {
                // image upload process start------------
                    $img_name = time();
                    $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 10, 's', 10);
                    $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 400, 'm', 70);
                    $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 600, 'l', 80);
                    $image_name = $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 1000, 'xl', 90);
                    
                    
                    $data['image_name'] = $image_name.".webp";
                // image upload process end--------------
            }

            

            /*now update data into database*/
            if(DB::table('galleries')->where(['id'=>$id])->update($data))
            {
                // delete old logo and banner start-----------------
                if(isset($request->img) && !empty($request->img))
                {
                    if(!is_dir('public/backend/images/gallery/s/'.$request->old_img_path) && file_exists('public/backend/images/gallery/s/'.$request->old_img_path)){
                        unlink('public/backend/images/gallery/s/'.$request->old_img_path);
                    }
                    if(!is_dir('public/backend/images/gallery/m/'.$request->old_img_path) && file_exists('public/backend/images/gallery/m/'.$request->old_img_path)){
                        unlink('public/backend/images/gallery/m/'.$request->old_img_path);
                    }
                    if(!is_dir('public/backend/images/gallery/l/'.$request->old_img_path) && file_exists('public/backend/images/gallery/l/'.$request->old_img_path)){
                        unlink('public/backend/images/gallery/l/'.$request->old_img_path);
                    }
                    if(!is_dir('public/backend/images/gallery/xl/'.$request->old_img_path) && file_exists('public/backend/images/gallery/xl/'.$request->old_img_path)){
                        unlink('public/backend/images/gallery/xl/'.$request->old_img_path);
                    }
                }

                set_msg("Gallery Information Updated Successfully !", 'success');
            }else{
                set_msg("Gallery Information Not Updated !", 'warning');
            }

            return redirect()->back();
        }
        /*gallery image update processing end ________________________________________________*/


        /*gallery image in trash start ________________________________________________*/
        public function trash_list()
        {
            $this->data['rows'] = DB::table('galleries')
                                  ->where([
                                        'status'=>0
                                    ])
                                  ->get();
            
            return view('backend.pages.gallery.trash')->with($this->data);
        }
        /*gallery image in trash end ________________________________________________*/



        /*gallery image trash processing start ________________________________________________*/
        public function trash(Request $request,$id){
            $delete_status = DB::table('galleries')
                             ->where(['id'=>$id])
                             ->update(['status'=>0]);

            if($delete_status){
                set_msg("Gallery Image Sent To Trash Successfully !", 'success');
            }else{
                set_msg("Gallery Image Not Sent To Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*gallery image trash processing end ________________________________________________*/



        /*gallery image restore processing start ________________________________________________*/
        public function restore(Request $request,$id){
            $delete_status = DB::table('galleries')
                             ->where(['id'=>$id])
                             ->update(['status'=>1]);
            
            if($delete_status){
                set_msg("Gallery Image Restore From Trash Successfully !", 'success');
            }else{
                set_msg("Gallery Image Not Restore From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*gallery image restore processing end ________________________________________________*/



        /*gallery image delete processing start ________________________________________________*/
        public function delete(Request $request,$id){
            $old_data      = DB::table('galleries')
                                ->where(['id'=>$id])
                                ->first();

            $delete_status = DB::table('galleries')
                             ->where(['id'=>$id])
                             ->delete();

            if($delete_status){
                // unlink all logo and banner of this subgallery start------------
                if(!is_dir('public/backend/images/gallery/s/'.$old_data->image_name) && file_exists('public/backend/images/gallery/s/'.$old_data->image_name)){
                    unlink('public/backend/images/gallery/s/'.$old_data->image_name);
                }
                if(!is_dir('public/backend/images/gallery/m/'.$old_data->image_name) && file_exists('public/backend/images/gallery/m/'.$old_data->image_name)){
                    unlink('public/backend/images/gallery/m/'.$old_data->image_name);
                }
                if(!is_dir('public/backend/images/gallery/l/'.$old_data->image_name) && file_exists('public/backend/images/gallery/l/'.$old_data->image_name)){
                    unlink('public/backend/images/gallery/l/'.$old_data->image_name);
                }
                if(!is_dir('public/backend/images/gallery/xl/'.$old_data->image_name) && file_exists('public/backend/images/gallery/xl/'.$old_data->image_name)){
                    unlink('public/backend/images/gallery/xl/'.$old_data->image_name);
                }
                // unlink all logo and banner of this subgallery end--------------
                
                set_msg("Gallery Permanently Deleted From Trash Successfully !", 'success');
            }else{
                set_msg("Gallery Not Permanently Deleted From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*gallery image delete processing end ________________________________________________*/



        

        private function create_image($image, $img_name, $prev_width, $prev_height, $new_width, $folder, $quality){
            if(!empty($image)){
                $base64_img = base64_decode($image);
                $base64_img = explode(',', $base64_img)[1];
                $base64_img = str_replace(' ', '+', $base64_img);            

                $image      = base64_decode($base64_img);
                
                $img_location = "public/backend/images/gallery/";
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