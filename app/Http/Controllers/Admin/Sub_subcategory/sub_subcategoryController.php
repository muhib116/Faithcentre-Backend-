<?php
    namespace App\Http\Controllers\Admin\Sub_subcategory;

    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use App\Helper\File_helper;
    use Illuminate\Support\Facades\DB;

    class sub_subcategoryController extends Controller{
        public $data = [];
        public function __construct() {
            $this->middleware('auth:admin_logins');

            $this->data['meta_keyword']     = "";
            $this->data['meta_description'] = "";
        }

        /*all image in sub_subcategory start ___________________________________*/
        public function index(){
            $this->data['rows'] = DB::table('sub_subcategories')
                                        ->leftJoin('subcategories', 'subcategories.id', '=', 'sub_subcategories.subcategory_id')
                                        ->leftJoin('categories', 'categories.id', '=', 'sub_subcategories.category_id')
                                        ->where([
                                            'sub_subcategories.status'=>1,
                                            'categories.status'=>1
                                        ])
                                        ->select(
                                            'categories.name as category_name',
                                            'subcategories.name as subcategory_name',
                                            'sub_subcategories.id as id',
                                            'sub_subcategories.name as sub_subcategory_name',
                                            'sub_subcategories.name_bn as sub_subcategory_name_bn',
                                            'sub_subcategories.logo_name as logo_name',
                                            'sub_subcategories.banner_name as banner_name'
                                        )
                                        ->get();

            return view('backend.pages.sub_subcategory.all')->with($this->data);
        }
        /*all image in sub_subcategory end _____________________________________*/


        /*add new image in sub_subcategory start ___________________________________*/
        public function create()
        {
            $this->data['category'] = \DB::table('categories')
                                        ->where(['status'=>1])
                                        ->select('id','name')
                                        ->get();

            return view('backend.pages.sub_subcategory.new')->with($this->data);
        }
        /*add new image in sub_subcategory end _____________________________________*/



        /*save sub_subcategory image to database start _____________________________________*/
        public function store(Request $request)
        {
            $request->validate([
                'category_id'    => 'required',
                'subcategory_id' => 'required',
                'name'           => 'required'
            ]);
            
            $img_name = time();

            // image upload process start------------
            $this->create_image($request->logo_img, $img_name, $request->logo_img_width, $request->logo_img_height, 200, 'logo/m', 70);
            $this->create_image($request->logo_img, $img_name, $request->logo_img_width, $request->logo_img_height, 400, 'logo/l', 70);
            $logo_image_name = $this->create_image($request->logo_img, $img_name, $request->logo_img_width, $request->logo_img_height, 950, 'logo/xl', 70);
            $banner_img_name = $this->create_image($request->banner_img, $img_name, $request->banner_img_width, $request->banner_img_height, 1200, 'banner', 70);
            // image upload process end--------------
            

            $data = [
                'created_at'     => date("Y-m-d H:i:s"),
                'updated_at'     => date("Y-m-d H:i:s"),
                'uploader_id'    => \Auth::id(),
                'category_id'    => $request->category_id,
                'subcategory_id' => $request->subcategory_id,
                'name'           => str_filter($request->name),
                'name_bn'        => $request->name_bn,
                'sounds_like'    => metaphone($request->name),
                'logo_name'      => $logo_image_name.".webp",
                'banner_name'    => $banner_img_name.".webp"
            ];
            

            /*now insert data into database*/
            if(DB::table('sub_subcategories')->insert($data)){
                set_msg("Sub-subcategory Information Uploaded Successfully !", 'success');
            }else{
                set_msg("Sub-subcategory Information Not Uploaded !", 'warning');
            }
            return redirect()->back();
        }
        /*save sub_subcategory image to database end _____________________________________*/



        /*sub_subcategory image update start ________________________________________________*/
        public function edit($id)
        {
            $this->data['category'] = \DB::table('categories')
                                        ->where(['status'=>1])
                                        ->select('id','name')
                                        ->get();

            // this id pass for delete single image
            $this->data['id'] = $id;

            if(\Auth::user()['admin_type']==='president'){
                $this->data['result'] = DB::table('sub_subcategories')->where(['id'=>$id])->first();
            }else{
                $this->data['result'] = DB::table('sub_subcategories')->where(['id'=>$id, 'uploader_id'=>\Auth::id()])->first();
            }
            return view('backend.pages.sub_subcategory.edit')->with($this->data);
        }
        /*sub_subcategory image update end ________________________________________________*/



        /*sub_subcategory image update processing start ________________________________________________*/
        public function edit_process(Request $request, $id){
            $request->validate([
                'name' => 'required|max:191'
            ]);

            $data = [
                'updated_at'  =>date("Y-m-d H:i:s"),
                'uploader_id' => \Auth::id(),
                'name'        => str_filter($request->name),
                'name_bn'     => $request->name_bn,
                'category_id' => $request->category_id,
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


            $existance = DB::table('sub_subcategories')
                         ->where([['id', '!=', $id],['name', '=', $request->name]])
                         ->first();

            if($existance==true){
                set_msg('Name Already Taken !','danger');
                return redirect()->back();
            }

            
            /*now update data into database*/
            if(DB::table('sub_subcategories')->where(['id'=>$id])->update($data)){
                // delete old logo and banner start-----------------
                if(!empty($request->logo_img))
                {
                    if(file_exists('public/backend/images/sub_subcategory/logo/m/'.$request->old_logo_img_path)){
                        unlink('public/backend/images/sub_subcategory/logo/m/'.$request->old_logo_img_path);
                    }
                    if(file_exists('public/backend/images/sub_subcategory/logo/l/'.$request->old_logo_img_path)){
                        unlink('public/backend/images/sub_subcategory/logo/l/'.$request->old_logo_img_path);
                    }
                    if(file_exists('public/backend/images/sub_subcategory/logo/xl/'.$request->old_logo_img_path)){
                        unlink('public/backend/images/sub_subcategory/logo/xl/'.$request->old_logo_img_path);
                    }
                }
                // delete old logo and banner start-----------------
                if(!empty($request->banner_img))
                {
                    if(file_exists('public/backend/images/sub_subcategory/banner/'.$request->old_banner_img_path)){
                        unlink('public/backend/images/sub_subcategory/banner/'.$request->old_banner_img_path);
                    }
                }
                // delete old logo and banner end-------------------

                set_msg("Sub-subcategory Information Updated Successfully !", 'success');
            }else{
                set_msg("Sub-subcategory Information Not Updated !", 'warning');
            }

            return redirect()->back();
        }
        /*sub_subcategory image update processing end ________________________________________________*/


        /*sub_subcategory image in trash start ________________________________________________*/
        public function trash_list()
        {
            $this->data['rows'] = DB::table('sub_subcategories')
                                        ->leftJoin('subcategories', 'subcategories.id', '=', 'sub_subcategories.subcategory_id')
                                        ->leftJoin('categories', 'categories.id', '=', 'sub_subcategories.category_id')
                                        ->where([
                                            'categories.status'=>1,
                                            'subcategories.status'=>1,
                                            'sub_subcategories.status'=>0,
                                        ])
                                        ->select(
                                            'categories.name as category_name',
                                            'subcategories.name as subcategory_name',
                                            'sub_subcategories.id as id',
                                            'sub_subcategories.name as sub_subcategory_name',
                                            'sub_subcategories.name_bn as sub_subcategory_name_bn',
                                            'sub_subcategories.logo_name as logo_name',
                                            'sub_subcategories.banner_name as banner_name'
                                        )
                                        ->get();  
            
            return view('backend.pages.sub_subcategory.trash')->with($this->data);
        }
        /*sub_subcategory image in trash end ________________________________________________*/



        /*sub_subcategory image trash processing start ________________________________________________*/
        public function trash(Request $request,$id){
            $delete_status = DB::table('sub_subcategories')
                             ->where(['id'=>$id])
                             ->update(['status'=>0]);

            if($delete_status){
                set_msg("Sub-subcategory Image Sent To Trash Successfully !", 'success');
            }else{
                set_msg("Sub-subcategory Image Not Sent To Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*sub_subcategory image trash processing end ________________________________________________*/



        /*sub_subcategory image restore processing start ________________________________________________*/
        public function restore(Request $request,$id){
            $delete_status = DB::table('sub_subcategories')
                             ->where(['id'=>$id])
                             ->update(['status'=>1]);
            
            if($delete_status){
                set_msg("Sub-subcategory Image Restore From Trash Successfully !", 'success');
            }else{
                set_msg("Sub-subcategory Image Not Restore From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*sub_subcategory image restore processing end ________________________________________________*/



        /*sub_subcategory image delete processing start ________________________________________________*/
        public function delete(Request $request,$id){
            $old_data      = DB::table('sub_subcategories')
                                ->where(['id'=>$id])
                                ->first();

            $delete_status = DB::table('sub_subcategories')
                             ->where(['id'=>$id])
                             ->delete();
            if($delete_status){
                // unlink all logo and banner of this sub_subcategory start------------
                if(file_exists('public/backend/images/sub_subcategory/logo/m/'.$old_data->logo_name)){
                    unlink('public/backend/images/sub_subcategory/logo/m/'.$old_data->logo_name);
                }
                if(file_exists('public/backend/images/sub_subcategory/logo/l/'.$old_data->logo_name)){
                    unlink('public/backend/images/sub_subcategory/logo/l/'.$old_data->logo_name);
                }
                if(file_exists('public/backend/images/sub_subcategory/logo/xl/'.$old_data->logo_name)){
                    unlink('public/backend/images/sub_subcategory/logo/xl/'.$old_data->logo_name);
                }

                if(file_exists('public/backend/images/sub_subcategory/banner/'.$old_data->banner_name)){
                    unlink('public/backend/images/sub_subcategory/banner/'.$old_data->banner_name);
                }
                // unlink all logo and banner of this sub_subcategory end--------------
                set_msg("Sub-subcategory Permanently Deleted From Trash Successfully !", 'success');
            }else{
                set_msg("Sub-subcategory Not Permanently Deleted From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*sub_subcategory image delete processing end ________________________________________________*/



        

        private function create_image($image, $img_name, $prev_width, $prev_height, $new_width, $folder, $quality){
            if(!empty($image)){
                $base64_img = base64_decode($image);
                $base64_img = explode(',', $base64_img)[1];
                $base64_img = str_replace(' ', '+', $base64_img);            

                $image      = base64_decode($base64_img);
                
                $img_location = "public/backend/images/sub_subcategory/";
                $img          = imagecreatefromstring($image);
                // dd($img);
                
                
                if($img = imagecreatefromstring($image)){
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
            }
            return null;
        }


        private function image_ratio($prev_width, $prev_height,$new_width){
            return [$new_width, (($prev_height/$prev_width)*$new_width)];
        }




        public function getSubcategoryByAjax()
        {
            $data = \DB::table('subcategories')
                    ->where(['category_id'=>$_POST['cat_id']])
                    ->select('id', 'name')
                    ->get();

            if(count($data)){
                echo json_encode($data);
            }else{
                echo 0;
            }
        }
    }
