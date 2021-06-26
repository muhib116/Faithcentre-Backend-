<?php
    namespace App\Http\Controllers\Admin\Pages;

    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use App\Helper\File_helper;
    use Illuminate\Support\Facades\DB;

    class pagesController extends Controller{
        public $data = [];
        public function __construct() {
            $this->middleware('auth:admin_logins');

            $this->data['meta_keyword']     = "";
            $this->data['meta_description'] = "";
        }


        /*all image in pages start ___________________________________*/
        public function index(){
            $this->data['rows'] = DB::table('pages')
                                  ->where([
                                        'status'=>1
                                    ])
                                  ->get();

            return view('backend.pages.pages.all')->with($this->data);
        }
        /*all image in pages end _____________________________________*/


        /*add new image in pages start ___________________________________*/
        public function create(){
            return view('backend.pages.pages.new')->with($this->data);
        }
        /*add new image in pages end _____________________________________*/



        /*save pages image to database start _____________________________________*/
        public function store(Request $request){
            $data = [
                'uploader_id'      => \Auth::id(),
                'name'             => $request->name,
                'slug'             => str_replace(' ', '-', strtolower($request->name)),
                'page'             => $request->page,
                'meta_description' => $request->meta_description
            ];
            

            /*now insert data into database*/
            if(DB::table('pages')->insert($data)){
                set_msg("Page Information Uploaded Successfully !", 'success');
            }else{
                set_msg("Page Information Not Uploaded !", 'warning');
            }
            return redirect()->back();
        }
        /*save pages image to database end _____________________________________*/



        /*pages image update start ________________________________________________*/
        public function edit($id){
            // this id pass for delete single image
            $this->data['id'] = $id;
            $this->data['result'] = DB::table('pages')->where(['id'=>$id])->first();
            
            return view('backend.pages.pages.edit')->with($this->data);
        }
        /*pages image update end ________________________________________________*/



        /*pages image update processing start ________________________________________________*/
        public function edit_process(Request $request, $id){
            $data = [
                'uploader_id'      => \Auth::id(),
                'name'             => $request->name,
                'slug'             => str_replace(' ', '-', strtolower($request->name)),
                'page'             => $request->page,
                'meta_description' => $request->meta_description
            ];

            /*now update data into database*/
            if(DB::table('pages')->where(['id'=>$id])->update($data))
            {
                set_msg("Page Information Updated Successfully !", 'success');
            }else{
                set_msg("Page Information Not Updated !", 'warning');
            }

            return redirect()->back();
        }
        /*pages image update processing end ________________________________________________*/


        /*pages image in trash start ________________________________________________*/
        public function trash_list(){
            $this->data['rows'] = DB::table('pages')
                                  ->where([
                                        'status'=>0
                                    ])
                                  ->get();  
            
            return view('backend.pages.pages.trash')->with($this->data);
        }
        /*pages image in trash end ________________________________________________*/



        /*pages image trash processing start ________________________________________________*/
        public function trash(Request $request,$id){
            $delete_status = DB::table('pages')
                             ->where(['id'=>$id])
                             ->update(['status'=>0]);

            if($delete_status){
                set_msg("Page Image Sent To Trash Successfully !", 'success');
            }else{
                set_msg("Page Image Not Sent To Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*pages image trash processing end ________________________________________________*/



        /*pages image restore processing start ________________________________________________*/
        public function restore(Request $request,$id){
            $delete_status = DB::table('pages')
                             ->where(['id'=>$id])
                             ->update(['status'=>1]);
            
            if($delete_status){
                set_msg("Page Restore From Trash Successfully !", 'success');
            }else{
                set_msg("Page Not Restore From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*pages image restore processing end ________________________________________________*/



        /*pages image delete processing start ________________________________________________*/
        public function delete(Request $request,$id){
            $old_data      = DB::table('pages')
                                ->where(['id'=>$id])
                                ->first();

            $delete_status = DB::table('pages')
                             ->where(['id'=>$id])
                             ->delete();
            
            if($delete_status){
                set_msg("Page Permanently Deleted From Trash Successfully !", 'success');
            }else{
                set_msg("Page Not Permanently Deleted From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*pages image delete processing end ________________________________________________*/



        

        private function create_image($image, $img_name, $prev_width, $prev_height, $new_width, $folder, $quality){
            if(!empty($image)){
                $base64_img = base64_decode($image);
                $base64_img = explode(',', $base64_img)[1];
                $base64_img = str_replace(' ', '+', $base64_img);            

                $image      = base64_decode($base64_img);
                
                $img_location = "public/backend/images/pages/";
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