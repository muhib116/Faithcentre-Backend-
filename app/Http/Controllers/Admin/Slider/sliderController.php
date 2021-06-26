<?php
    namespace App\Http\Controllers\Admin\Slider;

    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use App\Helper\File_helper;
    use Illuminate\Support\Facades\DB;

    class sliderController extends Controller{
        public $data = [];
        public function __construct() {
            $this->middleware('auth:admin_logins');

            $this->data['meta_keyword']     = "";
            $this->data['meta_description'] = "";
        }



        /*all image in slider start ___________________________________*/
        public function index(){
            if(\Auth::user()['admin_type']==='president'){
                $this->data['rows'] = DB::table('sliders')
                      ->where(['status'=>1])
                      ->get();  
            }else{
                $this->data['rows'] = DB::table('sliders')
                      ->where(['status'=>1,'uploader_id'=>\Auth::id()])
                      ->get();
            }              
            return view('backend.pages.slider.all')->with($this->data);
        }
        /*all image in slider end _____________________________________*/


        /*add new image in slider start ___________________________________*/
        public function create(){
            return view('backend.pages.slider.new')->with($this->data);
        }
        /*add new image in slider end _____________________________________*/



        /*save slider image to database start _____________________________________*/
        public function store(Request $request){
            $request->validate([
                'img'     => 'required'
            ]);

            $data = [
                'created_at'  => date("Y-m-d H:i:s"),
                'updated_at'  => date("Y-m-d H:i:s"),
                'uploader_id' => \Auth::id(),
                'caption'     => str_filter($request->caption),
                'link'        => str_filter($request->link),
                'anchor_text' => str_filter($request->anchor_text),
                'description' => str_filter($request->description)
            ];

            /*img upload processing start*/
            if(!is_null($request->img))
            {
                $img_name     = time();

                $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 200, 's', 70);
                $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 400, 'm', 70);
                $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 1000, 'l', 70);
                $img_name = $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 1900, '/xl', 80);

                $data['path'] = $img_name.'.webp';
            }
            /*img upload processing end*/
            
            /*now insert data into database*/
            if(DB::table('sliders')->insert($data)){
                set_msg("Slider Information Uploaded Successfully !", 'success');
            }else{
                set_msg("Slider Information Not Uploaded !", 'warning');
            }
            return redirect()->back();
        }
        /*save slider image to database end _____________________________________*/



        /*slider image update start ________________________________________________*/
        public function edit($id){
            // this id pass for delete single image
            $this->data['id'] = $id;

            if(\Auth::user()['admin_type'] === 'president'){
                $this->data['result'] = DB::table('sliders')->where(['id'=>$id])->first();
            }else{
                $this->data['result'] = DB::table('sliders')->where(['id'=>$id, 'uploader_id'=>\Auth::id()])->first();
            }
            return view('backend.pages.slider.edit')->with($this->data);
        }
        /*slider image update end ________________________________________________*/



        /*slider image update processing start ________________________________________________*/
        public function edit_process(Request $request, $id){
            $old_data = DB::table('sliders')
                        ->where(['id'=>$id])
                        ->first();
                        
            $data = [
                'created_at'  => date("Y-m-d H:i:s"),
                'updated_at'  => date("Y-m-d H:i:s"),
                'uploader_id' => \Auth::id(),
                'caption'     => str_filter($request->caption),
                'link'        => str_filter($request->link),
                'anchor_text' => str_filter($request->anchor_text),
                'description' => str_filter($request->description)
            ];

            /*img upload processing start*/
            if(!is_null($request->img))
            {
                $img_name = time();

                $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 200, 's', 70);
                $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 400, 'm', 70);
                $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 1000, 'l', 70);
                $img_name = $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 1900, '/xl', 80);

                $data['path'] = $img_name.'.webp';
            }
            /*img upload processing end*/


            
            /*now update data into database*/
            if(DB::table('sliders')->where(['id'=>$id])->update($data))
            {

                // delete old slider and banner start-----------------
                if(!empty($request->img))
                {
                    /*now delete slider image start*/
                   if(file_exists('public/backend/img/slider/s/'.$old_data->path)){
                        unlink('public/backend/img/slider/s/'.$old_data->path);
                    }
                    if(file_exists('public/backend/img/slider/m/'.$old_data->path)){
                        unlink('public/backend/img/slider/m/'.$old_data->path);
                    }
                    if(file_exists('public/backend/img/slider/l/'.$old_data->path)){
                        unlink('public/backend/img/slider/l/'.$old_data->path);
                    }
                    if(file_exists('public/backend/img/slider/xl/'.$old_data->path)){
                        unlink('public/backend/img/slider/xl/'.$old_data->path);
                    }
                   /*now delete slider image end--*/
                }
                // delete old slider and banner end-------------------

                set_msg("Slider Information Updated Successfully !", 'success');
            }else{
                set_msg("Slider Information Not Updated !", 'warning');
            }

            return redirect()->back();
        }
        /*slider image update processing end ________________________________________________*/


        /*slider image in trash start ________________________________________________*/
        public function trash_list(){
            if(\Auth::user()['admin_type']==='president'){
                $this->data['rows'] = DB::table('sliders')->where(['status'=>0])->get();
            }else{
                $this->data['rows'] = DB::table('sliders')->where(['status'=>0, 'uploader_id'=>\Auth::id()])->get();
            }
            return view('backend.pages.slider.trash')->with($this->data);
        }
        /*slider image in trash end ________________________________________________*/



        /*slider image trash processing start ________________________________________________*/
        public function trash(Request $request,$id){
            $delete_status = DB::table('sliders')
                             ->where(['id'=>$id])
                             ->update(['status'=>0]);

            if($delete_status){
                set_msg("Slider Successfully Sent To Trash !", 'success');
            }else{
                set_msg("Slider Not Sent To Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*slider image trash processing end ________________________________________________*/



        /*slider image restore processing start ________________________________________________*/
        public function restore(Request $request,$id){
            $delete_status = DB::table('sliders')
                             ->where(['id'=>$id])
                             ->update(['status'=>1]);
            
            if($delete_status){
                set_msg("Slider Restore From Trash Successfully !", 'success');
            }else{
                set_msg("Slider Not Restore From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*slider image restore processing end ________________________________________________*/



        /*slider image delete processing start ________________________________________________*/
        public function delete(Request $request,$id){
            $old_data      = DB::table('sliders')
                                ->where(['id'=>$id])
                                ->first();

            $delete_status = DB::table('sliders')
                             ->where(['id'=>$id])
                             ->delete();

            
            if($delete_status){
               /*now delete slider image start*/
               if(file_exists('public/backend/img/slider/s/'.$old_data->path)){
                    unlink('public/backend/img/slider/s/'.$old_data->path);
                }
                if(file_exists('public/backend/img/slider/m/'.$old_data->path)){
                    unlink('public/backend/img/slider/m/'.$old_data->path);
                }
                if(file_exists('public/backend/img/slider/l/'.$old_data->path)){
                    unlink('public/backend/img/slider/l/'.$old_data->path);
                }
                if(file_exists('public/backend/img/slider/xl/'.$old_data->path)){
                    unlink('public/backend/img/slider/xl/'.$old_data->path);
                }
               /*now delete slider image end--*/

                set_msg("Slider Permanently Deleted From Trash !", 'success');
            }else{
                set_msg("Slider Not Permanently Deleted From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*slider image delete processing end ________________________________________________*/









        

        private function create_image($image, $img_name, $prev_width, $prev_height, $new_width, $folder, $quality)
        {
            if(!empty($image))
            {
                $base64_img = base64_decode($image);
                $base64_img = explode(',', $base64_img)[1];
                $base64_img = str_replace(' ', '+', $base64_img);            

                $image      = base64_decode($base64_img);
                
                $img_location = "public/backend/img/slider/";
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
                return '';
            }
            
        }


        private function image_ratio($prev_width, $prev_height,$new_width){
            return [$new_width, (($prev_height/$prev_width)*$new_width)];
        }
    }