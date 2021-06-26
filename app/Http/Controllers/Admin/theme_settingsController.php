<?php
    namespace App\Http\Controllers\Admin;

    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use App\Helper\File_helper;
    use Illuminate\Support\Facades\DB;

    class theme_settingsController extends Controller{
        public $data = [];
        
        public function __construct() {
            $this->middleware('auth:admin_logins');
            $this->data['meta_keyword']     = "";
            $this->data['meta_description'] = "";
        }
        

        public function text_and_image(){
            $result = DB::table('system_theme_settings')
                                ->where(['status'=>1])
                                ->get();

            // data formatting for view page start
            $processed_data = [];
            if(count($result)>0){
                foreach ($result as $value) {
                    $theme_key   = $value->theme_key;
                    $theme_value = $value->theme_value;
                    $processed_data[$theme_key] = $theme_value;
                }
            }
            // data formatting for view page end

            $this->data['rows'] = $processed_data;
            return view('backend/pages/theme_settings/img_and_text')->with($this->data);
        }

        public function text_and_image_store(Request $request) {
            // push data into $data to formate it start
            $data = [];
            foreach($request->request as $key => $value){
                if($key != '_token' && $key != 'header_old_path' && $key != 'footer_old_path' && $key != 'favicon_old_path'){
                    $data[$key] = $value;
                }
            }
            // push data into $data to formate it end

            /*header logo process start here*/
            if(!is_null($request->header_logo)){
                /*if old path exists it should be delete this uploadImage() method start*/
                $old_location        = (isset($request->heaer_old_path) && !empty($request->heaer_old_path)) ? $request->heaer_old_path : null;
                /*if old path exists it should be delete this uploadImage() method end*/

                $target_location     = 'public/backend/img/logo';
                $img_name            = 'header_logo_'.rand(0,9999999)."_".time()*1000;

                $header_logo = File_helper::uploadImg($request, 'header_logo', $request->header_logo, $img_name, $target_location, $old_location);

                if($header_logo){
                    // upload old image when old image avilable start
                    if($request->header_old_path){
                       delete_single_img($request->header_old_path);
                    }
                    // upload old image when old image avilable end
                }
               
                $data['header_logo'] = $header_logo;
            }
            /*header logo process end here*/


            /*footer logo process start here*/
            if(!is_null($request->footer_logo)){
                /*if old path exists it should be delete this uploadImage() method start*/
                $old_location        = (isset($request->footer_old_path) && !empty($request->footer_old_path)) ? $request->footer_old_path : null;
                /*if old path exists it should be delete this uploadImage() method end*/

                $target_location     = 'public/backend/img/logo';
                $img_name            = 'footer_logo_'.rand(0,9999999)."_".time()*1000;

                $footer_logo = File_helper::uploadImg($request, 'footer_logo', $request->footer_logo, $img_name, $target_location, $old_location);

                if($footer_logo){
                    // upload old image when old image avilable start
                    if($request->footer_old_path){
                       delete_single_img($request->footer_old_path);
                    }
                    // upload old image when old image avilable end
                }

                $data['footer_logo'] = $footer_logo;
            }
            /*footer logo process end here*/


            /*favicon  process start here*/
            if(!is_null($request->favicon)){
                /*if old path exists it should be delete this uploadImage() method start*/
                $old_location        = (isset($request->favicon_old_path) && !empty($request->favicon_old_path)) ? $request->favicon_old_path : null;
                /*if old path exists it should be delete this uploadImage() method end*/
                
                $target_location     = 'public/backend/img/logo';
                $img_name            = 'favicon_'.rand(0,9999999)."_".time()*1000;

                $favicon = File_helper::uploadImg($request, 'favicon', $request->favicon, $img_name, $target_location, $old_location);

                if($favicon){
                    // upload old image when old image avilable start
                    if($request->favicon_old_path){
                       delete_single_img($request->favicon_old_path);
                    }
                    // upload old image when old image avilable end
                }
               
                $data['favicon'] = $favicon;
            }
            /*favicon  process end here*/

            // now insert or update data into database start
            foreach ($data as $key => $value) {
                $processed_data["theme_key"]   = $key;
                $processed_data["theme_value"] = $value;

                // check existance of this key start
                $exists = DB::table('system_theme_settings')
                            ->where(['theme_key'=>$key])
                            ->first();
                // check existance of this key end

                if($exists){
                    $updateStatus = DB::table('system_theme_settings')
                        ->where(['theme_key'=>$key])
                        ->update(['theme_value'=>$value]);

                    if($updateStatus){
                        set_msg("Data Updated Successfully !", "success");
                    }
                }else{
                    $insertStatus = DB::table('system_theme_settings')
                        ->insert($processed_data);
                    if($insertStatus){
                        set_msg("Data Inserted Successfully !", "success");
                    }else{
                        set_msg("Data Not Inserted !", "warning");
                        return redirect()->back();
                    }
                }
            }
            // now insert or update data into database end
            return redirect()->back();
        }

        public function settings()
        {
            $result = DB::table('system_theme_settings')
                                ->where(['status'=>1])
                                ->get();

            // data formatting for view page start
            $processed_data = [];
            if(count($result)>0){
                foreach ($result as $value) {
                    $theme_key   = $value->theme_key;
                    $theme_value = $value->theme_value;
                    $processed_data[$theme_key] = $theme_value;
                }
            }
            // data formatting for view page end

            $this->data['rows'] = $processed_data;
            return view('backend/pages/theme_settings/settings')->with($this->data);
        }

        public function settings_store(Request $request) {
            // push data into $data to formate it start
            $data = [];
            foreach($request->request as $key => $value){
                if($key != '_token' && $key != 'header_old_path' && $key != 'footer_old_path' && $key != 'favicon_old_path'){
                    $data[$key] = $value;
                }
            }
            // push data into $data to formate it end

            /*header logo process start here*/
            if(!is_null($request->header_logo)){
                /*if old path exists it should be delete this uploadImage() method start*/
                $old_location        = (isset($request->heaer_old_path) && !empty($request->heaer_old_path)) ? $request->heaer_old_path : null;
                /*if old path exists it should be delete this uploadImage() method end*/

                $target_location     = 'public/backend/img/logo';
                $img_name            = 'header_logo_'.rand(0,9999999)."_".time()*1000;

                $header_logo = File_helper::uploadImg($request, 'header_logo', $request->header_logo, $img_name, $target_location, $old_location);

                if($header_logo){
                    // upload old image when old image avilable start
                    if($request->header_old_path){
                       delete_single_img($request->header_old_path);
                    }
                    // upload old image when old image avilable end
                }
               
                $data['header_logo'] = $header_logo;
            }
            /*header logo process end here*/


            /*footer logo process start here*/
            if(!is_null($request->footer_logo)){
                /*if old path exists it should be delete this uploadImage() method start*/
                $old_location        = (isset($request->footer_old_path) && !empty($request->footer_old_path)) ? $request->footer_old_path : null;
                /*if old path exists it should be delete this uploadImage() method end*/

                $target_location     = 'public/backend/img/logo';
                $img_name            = 'footer_logo_'.rand(0,9999999)."_".time()*1000;

                $footer_logo = File_helper::uploadImg($request, 'footer_logo', $request->footer_logo, $img_name, $target_location, $old_location);

                if($footer_logo){
                    // upload old image when old image avilable start
                    if($request->footer_old_path){
                       delete_single_img($request->footer_old_path);
                    }
                    // upload old image when old image avilable end
                }

                $data['footer_logo'] = $footer_logo;
            }
            /*footer logo process end here*/


            /*favicon  process start here*/
            if(!is_null($request->favicon)){
                /*if old path exists it should be delete this uploadImage() method start*/
                $old_location        = (isset($request->favicon_old_path) && !empty($request->favicon_old_path)) ? $request->favicon_old_path : null;
                /*if old path exists it should be delete this uploadImage() method end*/
                
                $target_location     = 'public/backend/img/logo';
                $img_name            = 'favicon_'.rand(0,9999999)."_".time()*1000;

                $favicon = File_helper::uploadImg($request, 'favicon', $request->favicon, $img_name, $target_location, $old_location);

                if($favicon){
                    // upload old image when old image avilable start
                    if($request->favicon_old_path){
                       delete_single_img($request->favicon_old_path);
                    }
                    // upload old image when old image avilable end
                }
               
                $data['favicon'] = $favicon;
            }
            /*favicon  process end here*/

            // now insert or update data into database start
            foreach ($data as $key => $value) {
                $processed_data["theme_key"]   = $key;
                $processed_data["theme_value"] = $value;

                // check existance of this key start
                $exists = DB::table('system_theme_settings')
                            ->where(['theme_key'=>$key])
                            ->first();
                // check existance of this key end

                if($exists){
                    $updateStatus = DB::table('system_theme_settings')
                        ->where(['theme_key'=>$key])
                        ->update(['theme_value'=>$value]);

                    if($updateStatus){
                        set_msg("Data Updated Successfully !", "success");
                    }
                }else{
                    $insertStatus = DB::table('system_theme_settings')
                        ->insert($processed_data);
                    if($insertStatus){
                        set_msg("Data Inserted Successfully !", "success");
                    }else{
                        set_msg("Data Not Inserted !", "warning");
                        return redirect()->back();
                    }
                }
            }
            // now insert or update data into database end
            return redirect()->back();
        }
    }