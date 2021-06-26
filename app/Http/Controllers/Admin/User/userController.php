<?php
    namespace App\Http\Controllers\Admin\User;

    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use App\Helper\File_helper;
    use Illuminate\Support\Facades\DB;

    class userController extends Controller{
        public $data = [];
        public function __construct() {
            $this->middleware('auth:admin_logins');

            $this->data['meta_keyword']     = "";
            $this->data['meta_description'] = "";
        }


        function transection_process($user_id)
        {
            $data = [
                'updated_at' => date('Y-m-d'),
                'user_payment_status' => 1,
                'trx_id' => ''
            ];

            if(\DB::table('users')->where(['id'=>$user_id, ['trx_id', '!=', '']])->update($data)){
                set_msg('Payment accepted successfully !', 'success');
            }else{
                set_msg('Payment not accepted !', 'warning');
            }

            return redirect()->back();
        }



        /*all image in user start ___________________________________*/
        public function index(){
            if(\Auth::user()['admin_type']==='president'){
                $this->data['rows'] = DB::table('users')
                      ->where(['status'=>1])
                      ->get();  
            }else{
                $this->data['rows'] = DB::table('users')
                      ->where(['status'=>1,'uploader_id'=>\Auth::id()])
                      ->get();
            }              
            return view('backend.pages.user.all')->with($this->data);
        }
        /*all image in user end _____________________________________*/


        /*add new image in user start ___________________________________*/
        public function create(){
            return view('backend.pages.user.new')->with($this->data);
        }
        /*add new image in user end _____________________________________*/



        /*save user image to database start _____________________________________*/
        public function store(Request $request)
        {
            $data = [
                'created_at'  => date("Y-m-d H:i:s"),
                'updated_at'  => date("Y-m-d H:i:s"),
                'uploader_id' => \Auth::id(),
                'username'    => str_filter($request->username),
                'email'       => str_filter($request->email),
                'password'    => \Hash::make($request->password),
            ];

            /*img upload processing start*/
            /*if(!is_null($request->img))
            {
                $img_name     = time();

                $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 200, 's', 70);
                $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 400, 'm', 70);
                $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 1000, 'l', 70);
                $img_name = $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 1900, '/xl', 80);

                $data['path'] = $img_name.'.webp';
            }*/
            /*img upload processing end*/
            
            /*now insert data into database*/
            if(DB::table('users')->insert($data))
            {
                $mail_to   = $request->email;
                $mail_from = $request->send_from;
                $subject   = $request->subject;
                $mail_text = $request->mail_text;

                send_email($mail_from, $mail_to, $subject, $mail_text);

                set_msg("User Information Uploaded Successfully !", 'success');
            }else{
                set_msg("User Information Not Uploaded !", 'warning');
            }
            return redirect()->back();
        }
        /*save user image to database end _____________________________________*/



        /*user image update start ________________________________________________*/
        public function edit($id){
            // this id pass for delete single image
            $this->data['id'] = $id;

            if(\Auth::user()['admin_type'] === 'president'){
                $this->data['result'] = DB::table('users')->where(['id'=>$id])->first();
            }else{
                $this->data['result'] = DB::table('users')->where(['id'=>$id, 'uploader_id'=>\Auth::id()])->first();
            }
            return view('backend.pages.user.edit')->with($this->data);
        }
        /*user image update end ________________________________________________*/



        /*user image update processing start ________________________________________________*/
        public function edit_process(Request $request, $id){
            $old_data = DB::table('users')
                        ->where(['id'=>$id])
                        ->first();
                        
            $data = [
                'created_at'  => date("Y-m-d H:i:s"),
                'updated_at'  => date("Y-m-d H:i:s"),
                'uploader_id' => \Auth::id(),
                'username'    => str_filter($request->username),
                'email'       => str_filter($request->email),
                'password'    => \Hash::make($request->password),
            ];

            /*img upload processing start*/
            /*if(!is_null($request->img))
            {
                $img_name = time();

                $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 200, 's', 70);
                $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 400, 'm', 70);
                $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 1000, 'l', 70);
                $img_name = $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 1900, '/xl', 80);

                $data['path'] = $img_name.'.webp';
            }*/
            /*img upload processing end*/


            
            /*now update data into database*/
            if(DB::table('users')->where(['id'=>$id])->update($data))
            {

                // delete old user and banner start-----------------
                // if(!empty($request->img))
                // {
                    /*now delete user image start*/
                   /*if(file_exists('public/backend/img/user/s/'.$old_data->path)){
                        unlink('public/backend/img/user/s/'.$old_data->path);
                    }
                    if(file_exists('public/backend/img/user/m/'.$old_data->path)){
                        unlink('public/backend/img/user/m/'.$old_data->path);
                    }
                    if(file_exists('public/backend/img/user/l/'.$old_data->path)){
                        unlink('public/backend/img/user/l/'.$old_data->path);
                    }
                    if(file_exists('public/backend/img/user/xl/'.$old_data->path)){
                        unlink('public/backend/img/user/xl/'.$old_data->path);
                    }*/
                   /*now delete user image end--*/
                // }
                // delete old user and banner end-------------------

                set_msg("User Information Updated Successfully !", 'success');
            }else{
                set_msg("User Information Not Updated !", 'warning');
            }

            return redirect()->back();
        }
        /*user image update processing end ________________________________________________*/


        /*user image in trash start ________________________________________________*/
        public function trash_list(){
            if(\Auth::user()['admin_type']==='president'){
                $this->data['rows'] = DB::table('users')->where(['status'=>0])->get();
            }else{
                $this->data['rows'] = DB::table('users')->where(['status'=>0, 'uploader_id'=>\Auth::id()])->get();
            }
            return view('backend.pages.user.trash')->with($this->data);
        }
        /*user image in trash end ________________________________________________*/



        /*user image trash processing start ________________________________________________*/
        public function trash(Request $request,$id){
            $delete_status = DB::table('users')
                             ->where(['id'=>$id])
                             ->update(['status'=>0]);

            if($delete_status){
                set_msg("User Successfully Sent To Trash !", 'success');
            }else{
                set_msg("User Not Sent To Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*user image trash processing end ________________________________________________*/



        /*user image restore processing start ________________________________________________*/
        public function restore(Request $request,$id){
            $delete_status = DB::table('users')
                             ->where(['id'=>$id])
                             ->update(['status'=>1]);
            
            if($delete_status){
                set_msg("User Restore From Trash Successfully !", 'success');
            }else{
                set_msg("User Not Restore From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*user image restore processing end ________________________________________________*/



        /*user image delete processing start ________________________________________________*/
        public function delete(Request $request,$id){
            $old_data      = DB::table('users')
                                ->where(['id'=>$id])
                                ->first();

            $delete_status = DB::table('users')
                             ->where(['id'=>$id])
                             ->delete();

            
            if($delete_status){
               /*now delete user image start*/
               /*if(file_exists('public/backend/img/user/s/'.$old_data->path)){
                    unlink('public/backend/img/user/s/'.$old_data->path);
                }
                if(file_exists('public/backend/img/user/m/'.$old_data->path)){
                    unlink('public/backend/img/user/m/'.$old_data->path);
                }
                if(file_exists('public/backend/img/user/l/'.$old_data->path)){
                    unlink('public/backend/img/user/l/'.$old_data->path);
                }
                if(file_exists('public/backend/img/user/xl/'.$old_data->path)){
                    unlink('public/backend/img/user/xl/'.$old_data->path);
                }*/
               /*now delete user image end--*/

                set_msg("User Permanently Deleted From Trash !", 'success');
            }else{
                set_msg("User Not Permanently Deleted From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*user image delete processing end ________________________________________________*/









        

        private function create_image($image, $img_name, $prev_width, $prev_height, $new_width, $folder, $quality)
        {
            if(!empty($image))
            {
                $base64_img = base64_decode($image);
                $base64_img = explode(',', $base64_img)[1];
                $base64_img = str_replace(' ', '+', $base64_img);            

                $image      = base64_decode($base64_img);
                
                $img_location = "public/backend/img/user/";
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