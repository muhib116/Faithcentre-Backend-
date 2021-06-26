<?php
    namespace App\Http\Controllers\Admin\Page_section;

    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use App\Helper\File_helper;
    use Illuminate\Support\Facades\DB;

    class page_sectionController extends Controller{
        public $data = [];
        public function __construct() {
            $this->middleware('auth:admin_logins');

            $this->data['meta_keyword']     = "";
            $this->data['meta_description'] = "";
        }

        /*all image in page_section start ___________________________________*/
        public function index()
        {
            $this->data['rows'] = DB::table('page_sections')
                                  ->where([
                                        'status'=>1
                                    ])
                                  ->get();

            return view('backend.pages.page_section.all')->with($this->data);
        }
        /*all image in page_section end _____________________________________*/


        /*add new image in page_section start ___________________________________*/
        public function create(){
            return view('backend.pages.page_section.new')->with($this->data);
        }
        /*add new image in page_section end _____________________________________*/



        /*save page_section image to database start _____________________________________*/
        public function store(Request $request)
        {
            $meta_key   = $request->meta_key;
            $meta_value = $request->meta_value;

            $data = [
                'uploader_id' => \Auth::id(),

                "section_name"  => $request->section_name,
                "title"         => $request->title,
                "slug"          => $request->slug,
                "short_detail"  => $request->short_detail,
                "detail"        => $request->detail,
                "note"          => $request->note,
                'created_at'    =>date("Y-m-d H:i:s"),
                'updated_at'    =>date("Y-m-d H:i:s")
            ];

            if(isset($request->img) && !empty($request->img))
            {
                // image upload process start------------
                    $img_name = time();
                    $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 10, 'm', 10);
                    $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 400, 'l', 80);
                    $image_name = $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 950, 'xl', 90);
                    
                    
                    $data['image_name'] = $image_name.".webp";
                // image upload process end--------------
            }
            
            

            /*now insert data into database*/
            if($section_id = \DB::table('page_sections')->insertGetId($data))
            {
                /*add meta data to db start*/
                for($i=0; $i<count($meta_key); $i++)
                {
                    if(!empty($meta_key[$i] && $meta_value[$i]))
                    {
                        $meta_data = [
                            'section_id' => $section_id,
                            'meta_key'   => $meta_key[$i],
                            'meta_value' => $meta_value[$i]
                        ];
                        \DB::table('page_section_meta')->insert($meta_data);
                    }

                }
                /*add meta data to db end*/

                set_msg("Page Section Information Uploaded Successfully !", 'success');
            }else{
                set_msg("Page Section Information Not Uploaded !", 'warning');
            }
            return redirect()->back();
        }
        /*save page_section image to database end _____________________________________*/



        /*page_section image update start ________________________________________________*/
        public function edit($id)
        {
            $this->data['result'] = DB::table('page_sections')->where(['id'=>$id])->first();

            return view('backend.pages.page_section.edit')->with($this->data);
        }
        /*page_section image update end ________________________________________________*/



        /*page_section image update processing start ________________________________________________*/
        public function edit_process(Request $request, $id)
        {
            $meta_key   = $request->meta_key;
            $meta_value = $request->meta_value;

            $data = [
                'uploader_id' => \Auth::id(),

                "section_name"  => $request->section_name,
                "title"         => $request->title,
                "slug"          => $request->slug,
                "short_detail"  => $request->short_detail,
                "detail"        => $request->detail,
                "note"          => $request->note,
                'created_at'    =>date("Y-m-d H:i:s"),
                'updated_at'    =>date("Y-m-d H:i:s")
            ];


            $img_name     = time();


            if(isset($request->img) && !empty($request->img))
            {
                // image upload process start------------
                    $img_name = time();
                    $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 10, 'm', 10);
                    $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 400, 'l', 80);
                    $image_name = $this->create_image($request->img, $img_name, $request->img_width, $request->img_height, 900, 'xl', 90);
                    
                    
                    $data['image_name'] = $image_name.".webp";
                // image upload process end--------------
            }

            

            // delete preve meta data according to id
            \DB::table('page_section_meta')->where(['section_id'=>$id])->delete();

            /*add meta data to db start*/
                for($i=0; $i<count($meta_key); $i++)
                {
                    if(!empty($meta_key[$i] && $meta_value[$i]))
                    {
                        $meta_data = [
                            'section_id' => $id,
                            'meta_key'   => $meta_key[$i],
                            'meta_value' => $meta_value[$i]
                        ];
                        \DB::table('page_section_meta')->insert($meta_data);
                    }
                }
            /*add meta data to db end*/



            /*now update data into database*/
            if(DB::table('page_sections')->where(['id'=>$id])->update($data))
            {
                // delete old logo and banner start-----------------
                if(isset($request->img) && !empty($request->img))
                {
                    if(!is_dir('public/backend/images/page_section/m/'.$request->old_img_path) && file_exists('public/backend/images/page_section/m/'.$request->old_img_path)){
                        unlink('public/backend/images/page_section/m/'.$request->old_img_path);
                    }
                    if(!is_dir('public/backend/images/page_section/l/'.$request->old_img_path) && file_exists('public/backend/images/page_section/l/'.$request->old_img_path)){
                        unlink('public/backend/images/page_section/l/'.$request->old_img_path);
                    }
                    if(!is_dir('public/backend/images/page_section/xl/'.$request->old_img_path) && file_exists('public/backend/images/page_section/xl/'.$request->old_img_path)){
                        unlink('public/backend/images/page_section/xl/'.$request->old_img_path);
                    }
                }

                set_msg("Page Section Information Updated Successfully !", 'success');
            }else{
                set_msg("Page Section Information Not Updated !", 'warning');
            }

            return redirect()->back();
        }
        /*page_section image update processing end ________________________________________________*/


        /*page_section image in trash start ________________________________________________*/
        public function trash_list()
        {
            $this->data['rows'] = DB::table('page_sections')
                                  ->where([
                                        'status'=>0
                                    ])
                                  ->get();
            
            return view('backend.pages.page_section.trash')->with($this->data);
        }
        /*page_section image in trash end ________________________________________________*/



        /*page_section image trash processing start ________________________________________________*/
        public function trash(Request $request,$id){
            $delete_status = DB::table('page_sections')
                             ->where(['id'=>$id])
                             ->update(['status'=>0]);

            if($delete_status){
                set_msg("Page Section Image Sent To Trash Successfully !", 'success');
            }else{
                set_msg("Page Section Image Not Sent To Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*page_section image trash processing end ________________________________________________*/



        /*page_section image restore processing start ________________________________________________*/
        public function restore(Request $request,$id){
            $delete_status = DB::table('page_sections')
                             ->where(['id'=>$id])
                             ->update(['status'=>1]);
            
            if($delete_status){
                set_msg("Page Section Image Restore From Trash Successfully !", 'success');
            }else{
                set_msg("Page Section Image Not Restore From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*page_section image restore processing end ________________________________________________*/



        /*page_section image delete processing start ________________________________________________*/
        public function delete(Request $request,$id){
            $old_data      = DB::table('page_sections')
                                ->where(['id'=>$id])
                                ->first();

            $delete_status = DB::table('page_sections')
                             ->where(['id'=>$id])
                             ->delete();

            // delete meta data according to id
            \DB::table('page_section_meta')->where(['section_id'=>$id])->delete();

            
            if($delete_status){
                // unlink all logo and banner of this subpage_section start------------
                if(!is_dir('public/backend/images/page_section/m/'.$old_data->image_name) && file_exists('public/backend/images/page_section/m/'.$old_data->image_name)){
                    unlink('public/backend/images/page_section/m/'.$old_data->image_name);
                }
                if(!is_dir('public/backend/images/page_section/l/'.$old_data->image_name) && file_exists('public/backend/images/page_section/l/'.$old_data->image_name)){
                    unlink('public/backend/images/page_section/l/'.$old_data->image_name);
                }
                if(!is_dir('public/backend/images/page_section/xl/'.$old_data->image_name) && file_exists('public/backend/images/page_section/xl/'.$old_data->image_name)){
                    unlink('public/backend/images/page_section/xl/'.$old_data->image_name);
                }
                // unlink all logo and banner of this subpage_section end--------------
                
                set_msg("Page Section Permanently Deleted From Trash Successfully !", 'success');
            }else{
                set_msg("Page Section Not Permanently Deleted From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*page_section image delete processing end ________________________________________________*/



        

        private function create_image($image, $img_name, $prev_width, $prev_height, $new_width, $folder, $quality){
            if(!empty($image)){
                $base64_img = base64_decode($image);
                $base64_img = explode(',', $base64_img)[1];
                $base64_img = str_replace(' ', '+', $base64_img);            

                $image      = base64_decode($base64_img);
                
                $img_location = "public/backend/images/page_section/";
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