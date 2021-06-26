<?php
    namespace App\Http\Controllers\Admin\Team;

    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use App\Helper\File_helper;
    use Illuminate\Support\Facades\DB;

    class teamController extends Controller{
        public $data = [];
        public function __construct() {
            $this->middleware('auth:admin_logins');

            $this->data['meta_keyword']     = "";
            $this->data['meta_description'] = "";
        }

        /*all image in team start ___________________________________*/
        public function index()
        {
            $this->data['rows'] = DB::table('our_teams')
                                  ->where([
                                        'status'=>1
                                    ])
                                  ->get();

            return view('backend.pages.team.all')->with($this->data);
        }
        /*all image in team end _____________________________________*/


        /*add new image in team start ___________________________________*/
        public function create(){
            return view('backend.pages.team.new')->with($this->data);
        }
        /*add new image in team end _____________________________________*/



        /*save team image to database start _____________________________________*/
        public function store(Request $request)
        {
            /*socia info start*/
                $icon = $request->icon;
                $link = $request->link;

                $social_info = [];

                for($i = 0; $i < count($icon); $i++)
                {
                    if(!empty($link[$i]))
                    {
                        $social_info[str_replace("-", '_', $icon[$i])] = [
                            "icon" => $icon[$i],
                            "link" => $link[$i]
                        ];
                    }
                }
            /*socia info end*/


            $data = [
                'uploader_id' => \Auth::id(),
                "name"        => $request->name,
                "slug"        => $request->slug,
                "detail"      => $request->detail,
                "designation" => $request->designation,
                "social_info" => json_encode($social_info),
                'created_at'  => date("Y-m-d H:i:s"),
                'updated_at'  => date("Y-m-d H:i:s")
            ];

            if(isset($request->img) && !empty($request->img))
            {
                // image upload process start------------
                    $img_name = time();
                    $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 10, 'm', 10);
                    $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 400, 'l', 80);
                    $image_name = $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 1000, 'xl', 90);
                    
                    
                    $data['image_name'] = $image_name.".webp";
                // image upload process end--------------
            }
            
            

            /*now insert data into database*/
            if($section_id = \DB::table('our_teams')->insertGetId($data))
            {
                set_msg("Team Information Uploaded Successfully !", 'success');
            }else{
                set_msg("Team Information Not Uploaded !", 'warning');
            }
            return redirect()->back();
        }
        /*save team image to database end _____________________________________*/



        /*team image update start ________________________________________________*/
        public function edit($id)
        {
            $this->data['result'] = DB::table('our_teams')->where(['id'=>$id])->first();

            return view('backend.pages.team.edit')->with($this->data);
        }
        /*team image update end ________________________________________________*/



        /*team image update processing start ________________________________________________*/
        public function edit_process(Request $request, $id)
        {
            /*socia info start*/
                $icon = $request->icon;
                $link = $request->link;

                $social_info = [];

                for($i = 0; $i < count($icon); $i++)
                {
                    if(!empty($link[$i]))
                    {
                        $social_info[str_replace("-", '_', $icon[$i])] = [
                            "icon" => $icon[$i],
                            "link" => $link[$i]
                        ];
                    }
                }
            /*socia info end*/


            $data = [
                'uploader_id' => \Auth::id(),
                "name"        => $request->name,
                "slug"        => $request->slug,
                "detail"      => $request->detail,
                "designation" => $request->designation,
                "social_info" => json_encode($social_info),
                'created_at'  => date("Y-m-d H:i:s"),
                'updated_at'  => date("Y-m-d H:i:s")
            ];

            if(isset($request->img) && !empty($request->img))
            {
                // image upload process start------------
                    $img_name = time();
                    $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 10, 'm', 10);
                    $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 600, 'l', 80);
                    $image_name = $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 1000, 'xl', 90);
                    
                    
                    $data['image_name'] = $image_name.".webp";
                // image upload process end--------------
            }

            

            /*now update data into database*/
            if(DB::table('our_teams')->where(['id'=>$id])->update($data))
            {
                // delete old logo and banner start-----------------
                if(isset($request->img) && !empty($request->img))
                {
                    if(!is_dir('public/backend/images/team/m/'.$request->old_img_path) && file_exists('public/backend/images/team/m/'.$request->old_img_path)){
                        unlink('public/backend/images/team/m/'.$request->old_img_path);
                    }
                    if(!is_dir('public/backend/images/team/l/'.$request->old_img_path) && file_exists('public/backend/images/team/l/'.$request->old_img_path)){
                        unlink('public/backend/images/team/l/'.$request->old_img_path);
                    }
                    if(!is_dir('public/backend/images/team/xl/'.$request->old_img_path) && file_exists('public/backend/images/team/xl/'.$request->old_img_path)){
                        unlink('public/backend/images/team/xl/'.$request->old_img_path);
                    }
                }

                set_msg("Team Information Updated Successfully !", 'success');
            }else{
                set_msg("Team Information Not Updated !", 'warning');
            }

            return redirect()->back();
        }
        /*team image update processing end ________________________________________________*/


        /*team image in trash start ________________________________________________*/
        public function trash_list()
        {
            $this->data['rows'] = DB::table('our_teams')
                                  ->where([
                                        'status'=>0
                                    ])
                                  ->get();
            
            return view('backend.pages.team.trash')->with($this->data);
        }
        /*team image in trash end ________________________________________________*/



        /*team image trash processing start ________________________________________________*/
        public function trash(Request $request,$id){
            $delete_status = DB::table('our_teams')
                             ->where(['id'=>$id])
                             ->update(['status'=>0]);

            if($delete_status){
                set_msg("Team Image Sent To Trash Successfully !", 'success');
            }else{
                set_msg("Team Image Not Sent To Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*team image trash processing end ________________________________________________*/



        /*team image restore processing start ________________________________________________*/
        public function restore(Request $request,$id){
            $delete_status = DB::table('our_teams')
                             ->where(['id'=>$id])
                             ->update(['status'=>1]);
            
            if($delete_status){
                set_msg("Team Image Restore From Trash Successfully !", 'success');
            }else{
                set_msg("Team Image Not Restore From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*team image restore processing end ________________________________________________*/



        /*team image delete processing start ________________________________________________*/
        public function delete(Request $request,$id){
            $old_data      = DB::table('our_teams')
                                ->where(['id'=>$id])
                                ->first();

            $delete_status = DB::table('our_teams')
                             ->where(['id'=>$id])
                             ->delete();

            
            if($delete_status){
                // unlink all logo and banner of this subteam start------------
                if(!is_dir('public/backend/images/team/m/'.$old_data->image_name) && file_exists('public/backend/images/team/m/'.$old_data->image_name)){
                    unlink('public/backend/images/team/m/'.$old_data->image_name);
                }
                if(!is_dir('public/backend/images/team/l/'.$old_data->image_name) && file_exists('public/backend/images/team/l/'.$old_data->image_name)){
                    unlink('public/backend/images/team/l/'.$old_data->image_name);
                }
                if(!is_dir('public/backend/images/team/xl/'.$old_data->image_name) && file_exists('public/backend/images/team/xl/'.$old_data->image_name)){
                    unlink('public/backend/images/team/xl/'.$old_data->image_name);
                }
                // unlink all logo and banner of this subteam end--------------
                
                set_msg("Team Permanently Deleted From Trash Successfully !", 'success');
            }else{
                set_msg("Team Not Permanently Deleted From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*team image delete processing end ________________________________________________*/



        

        private function create_image($image, $img_name, $prev_width, $prev_height, $new_width, $folder, $quality){
            if(!empty($image)){
                $base64_img = base64_decode($image);
                $base64_img = explode(',', $base64_img)[1];
                $base64_img = str_replace(' ', '+', $base64_img);            

                $image      = base64_decode($base64_img);
                
                $img_location = "public/backend/images/team/";
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