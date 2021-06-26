<?php
    namespace App\Http\Controllers\Admin\Customer_feedback;

    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use App\Helper\File_helper;
    use Illuminate\Support\Facades\DB;

    class customer_feedbackController extends Controller{
        public $data = [];
        public function __construct() {
            $this->middleware('auth:admin_logins');

            $this->data['meta_keyword']     = "";
            $this->data['meta_description'] = "";
        }



        /*all image in customer_feedback start ___________________________________*/
        public function index()
        {
            $this->data['rows'] = DB::table('customer_feedbacks')
                  ->where(['status'=>1])
                  ->get();

            return view('backend.pages.customer_feedback.all')->with($this->data);
        }
        /*all image in customer_feedback end _____________________________________*/


        /*add new image in customer_feedback start ___________________________________*/
        public function create(){
            return view('backend.pages.customer_feedback.new')->with($this->data);
        }
        /*add new image in customer_feedback end _____________________________________*/



        /*save customer_feedback image to database start _____________________________________*/
        public function store(Request $request){
            $request->validate([
                'img' => 'required'
            ]);

            $data = [
                'created_at'  => date("Y-m-d H:i:s"),
                'updated_at'  => date("Y-m-d H:i:s"),
                'uploader_id' => \Auth::id(),
                'name'    => str_filter($request->name),
                'country' => str_filter($request->country),
                'details' => str_filter($request->details),
            ];

            /*img upload processing start*/
            if(!is_null($request->img))
            {
                $img_name = time();

                $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 5, 's', 10);
                $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 400, 'm', 70);
                $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 600, 'l', 80);
                $img_name = $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 800, '/xl', 90);

                $data['path'] = $img_name.'.webp';
            }
            /*img upload processing end*/
            
            /*now insert data into database*/
            if(DB::table('customer_feedbacks')->insert($data)){
                set_msg("Customer_feedback Information Uploaded Successfully !", 'success');
            }else{
                set_msg("Customer_feedback Information Not Uploaded !", 'warning');
            }
            return redirect()->back();
        }
        /*save customer_feedback image to database end _____________________________________*/



        /*customer_feedback image update start ________________________________________________*/
        public function edit($id)
        {
            $this->data['result'] = DB::table('customer_feedbacks')->where(['id'=>$id])->first();
            return view('backend.pages.customer_feedback.edit')->with($this->data);
        }
        /*customer_feedback image update end ________________________________________________*/



        /*customer_feedback image update processing start ________________________________________________*/
        public function edit_process(Request $request, $id)
        {
            $old_data = DB::table('customer_feedbacks')
                        ->where(['id'=>$id])
                        ->first();
                        
            $data = [
                'created_at'  => date("Y-m-d H:i:s"),
                'updated_at'  => date("Y-m-d H:i:s"),
                'uploader_id' => \Auth::id(),
                'name'        => str_filter($request->name),
                'country'     => str_filter($request->country),
                'details'     => str_filter($request->details),
            ];

            /*img upload processing start*/
            if(!is_null($request->img))
            {
                $img_name = time();

                $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 5, 's', 10);
                $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 400, 'm', 70);
                $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 600, 'l', 80);
                $img_name = $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 800, '/xl', 90);

                $data['path'] = $img_name.'.webp';
            }
            /*img upload processing end*/


            /*now update data into database*/
            if(DB::table('customer_feedbacks')->where(['id'=>$id])->update($data))
            {

                // delete old customer_feedback and banner start-----------------
                if(!empty($request->img))
                {
                    /*now delete customer_feedback image start*/
                   if(file_exists('public/backend/img/customer_feedback/s/'.$old_data->path)){
                        unlink('public/backend/img/customer_feedback/s/'.$old_data->path);
                    }
                    if(file_exists('public/backend/img/customer_feedback/m/'.$old_data->path)){
                        unlink('public/backend/img/customer_feedback/m/'.$old_data->path);
                    }
                    if(file_exists('public/backend/img/customer_feedback/l/'.$old_data->path)){
                        unlink('public/backend/img/customer_feedback/l/'.$old_data->path);
                    }
                    if(file_exists('public/backend/img/customer_feedback/xl/'.$old_data->path)){
                        unlink('public/backend/img/customer_feedback/xl/'.$old_data->path);
                    }
                   /*now delete customer_feedback image end--*/
                }
                // delete old customer_feedback and banner end-------------------

                set_msg("Customer_feedback Information Updated Successfully !", 'success');
            }else{
                set_msg("Customer_feedback Information Not Updated !", 'warning');
            }

            return redirect()->back();
        }
        /*customer_feedback image update processing end ________________________________________________*/


        /*customer_feedback image in trash start ________________________________________________*/
        public function trash_list()
        {
            $this->data['rows'] = DB::table('customer_feedbacks')->where(['status'=>0])->get();
            
            return view('backend.pages.customer_feedback.trash')->with($this->data);
        }
        /*customer_feedback image in trash end ________________________________________________*/



        /*customer_feedback image trash processing start ________________________________________________*/
        public function trash(Request $request,$id){
            $delete_status = DB::table('customer_feedbacks')
                             ->where(['id'=>$id])
                             ->update(['status'=>0]);

            if($delete_status){
                set_msg("Customer_feedback Successfully Sent To Trash !", 'success');
            }else{
                set_msg("Customer_feedback Not Sent To Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*customer_feedback image trash processing end ________________________________________________*/



        /*customer_feedback image restore processing start ________________________________________________*/
        public function restore(Request $request,$id){
            $delete_status = DB::table('customer_feedbacks')
                             ->where(['id'=>$id])
                             ->update(['status'=>1]);
            
            if($delete_status){
                set_msg("Customer_feedback Restore From Trash Successfully !", 'success');
            }else{
                set_msg("Customer_feedback Not Restore From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*customer_feedback image restore processing end ________________________________________________*/



        /*customer_feedback image delete processing start ________________________________________________*/
        public function delete(Request $request,$id){
            $old_data      = DB::table('customer_feedbacks')
                                ->where(['id'=>$id])
                                ->first();

            $delete_status = DB::table('customer_feedbacks')
                             ->where(['id'=>$id])
                             ->delete();

            
            if($delete_status){
               /*now delete customer_feedback image start*/
               if(file_exists('public/backend/img/customer_feedback/s/'.$old_data->path)){
                    unlink('public/backend/img/customer_feedback/s/'.$old_data->path);
                }
                if(file_exists('public/backend/img/customer_feedback/m/'.$old_data->path)){
                    unlink('public/backend/img/customer_feedback/m/'.$old_data->path);
                }
                if(file_exists('public/backend/img/customer_feedback/l/'.$old_data->path)){
                    unlink('public/backend/img/customer_feedback/l/'.$old_data->path);
                }
                if(file_exists('public/backend/img/customer_feedback/xl/'.$old_data->path)){
                    unlink('public/backend/img/customer_feedback/xl/'.$old_data->path);
                }
               /*now delete customer_feedback image end--*/

                set_msg("Customer_feedback Permanently Deleted From Trash !", 'success');
            }else{
                set_msg("Customer_feedback Not Permanently Deleted From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*customer_feedback image delete processing end ________________________________________________*/









        

        private function create_image($image, $img_name, $prev_width, $prev_height, $new_width, $folder, $quality)
        {
            if(!empty($image))
            {
                $base64_img = base64_decode($image);
                $base64_img = explode(',', $base64_img)[1];
                $base64_img = str_replace(' ', '+', $base64_img);            

                $image      = base64_decode($base64_img);
                
                $img_location = "public/backend/img/customer_feedback/";
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