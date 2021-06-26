<?php
    namespace App\Helper;
    use Request;
    use Image;
    use File;

    class File_helper{
        // upload image
        public static function uploadImg($request, $inputFieldName, $laravelRequestFileInfo, $name, $target_location, $old_path=null){
            if (Request::isMethod('post')) {
                if($request->hasFile($inputFieldName)){
                    $request->validate([
                        $inputFieldName => 'required',
                        $inputFieldName => 'image|mimes:jpeg,jpg,png,gif,webp,jfif|max:2048'
                    ]);
    
                    $filename = $name.'.'.$laravelRequestFileInfo->getClientOriginalExtension();
                    $newPath = ($target_location.'/'.$filename);

                    // process image
                    if($old_path==null){
                       Image::make($laravelRequestFileInfo)->save($newPath);
                    }else{
                        /*if old file exist delete this*/
                        if (File::exists($old_path)) {
                            File::delete($old_path);
                        }
                        Image::make($laravelRequestFileInfo)->save($newPath);
                    }
                    return $newPath;
                }
            }
        }


        // upload image with resize
        public static function uploadImgWithResize($request, $inputFieldName, $laravelRequestFileInfo, $name, $target_location, $quality=60, $width=300, $height=null, $old_path=null){
            if (Request::isMethod('post')) {
                if($request->hasFile($inputFieldName)){
                    $request->validate([
                        $inputFieldName => 'required',
                        $inputFieldName => 'image|mimes:jpeg,jpg,png,gif,webp,jfif|max:2048'
                    ]);
            
                    $filename = $name.'.'.$laravelRequestFileInfo->getClientOriginalExtension();
                    $newPath = ($target_location.'/'.$filename);

                    /*calculate image height with aspected retio*/
                    if(getimagesize($laravelRequestFileInfo)){
                        if($height === null){
                            list($oldWidth, $oldHeight) = getimagesize($laravelRequestFileInfo);
                            $height = ($width/$oldWidth)*$oldHeight;
                        }

                        // process image
                        if($old_path==null){
                           Image::make($laravelRequestFileInfo)->resize($width, $height)->save($newPath, $quality);
                        }else{
                            /*if old file exist delete this*/
                            if (File::exists($old_path)) {
                                File::delete($old_path);
                            }
                            Image::make($laravelRequestFileInfo)->resize($width, $height)->save($newPath, $quality);
                        }
                    }
                    return $newPath;
                }
            }
        }
 
        public static function deleteFile($location=null){
            if($location!==null){
                File::delete($location);
            }else{
                return false;
            }
        }
    }