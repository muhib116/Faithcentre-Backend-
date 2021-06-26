<?php
    namespace App\Http\Controllers\Admin\Media;

    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use App\Helper\File_helper;
    use Illuminate\Support\Facades\DB;
    use Validator;

    class mediaController extends Controller{
        public $data = [];
        public function __construct() {
            $this->middleware('auth:admin_logins');

            $this->data['meta_keyword']     = "";
            $this->data['meta_description'] = "";

            $this->data['categories'] = \DB::table('media_categories')->where(['type'=>'image', 'status'=>1])->get();
        }

        /*all image in media start ___________________________________*/
        public function index(){
            $this->data['rows'] = DB::table('media')
                                  ->where([
                                        'status'=>1
                                    ])
                                  ->get();

            return view('backend.pages.media.all')->with($this->data);
        }
        /*all image in media end _____________________________________*/


        /*add new image in media start ___________________________________*/
        public function create()
        {
            $cond = ['status'=>1];

            if(isset($_REQUEST['category_id']) && !empty($_REQUEST['category_id']))
            {
                $cond['category_id'] = $_REQUEST['category_id'];
            }

            $this->data["files"] = \DB::table('media')->where($cond)->orderby('id', 'DESC')->get();
            return view('backend.pages.media.new')->with($this->data);
        }
        /*add new image in media end _____________________________________*/


        public function catAsJson()
        {
            $my_categories = \DB::table('media_categories')->where(['type'=>'image', 'status'=>1])->select('id', 'name')->get();
            if(count($my_categories))
            {
                return $my_categories->toJson();
            }else{
                return 0;
            }
        }


        public function update_media_info(Request $request)
        {
            $info = json_decode($request->info);

            $cond = ['id'=>$info->media_id];
            $data = [
                'alt_text'    => $info->alt_text,
                'title'       => $info->title,
                'caption'     => $info->caption,
                'category_id' => $info->category,
                'description' => $info->description,
                'meta_description' => $info->meta_description,
                'meta_tages'       => $info->meta_tages
            ];

            if(\DB::table('media')->where($cond)->update($data))
            {
                echo 1;
            }else{
                echo 0;
            }
        }


        public function delete_media_info(Request $request)
        {
            $media_id = $request->media_id;   
            $old_file = \DB::table('media')->where(['id'=>$media_id])->first();

            if($old_file)
            {
                if(\DB::table('media')->where(['id'=>$media_id])->delete())
                {
                    if(file_exists('public/backend/media/s/'.$old_file->file_name))
                    {
                        unlink(('public/backend/media/s/'.$old_file->file_name));
                    }
                    if(file_exists('public/backend/media/m/'.$old_file->file_name))
                    {
                        unlink(('public/backend/media/m/'.$old_file->file_name));
                    }
                    if(file_exists('public/backend/media/l/'.$old_file->file_name))
                    {
                        unlink(('public/backend/media/l/'.$old_file->file_name));
                    }
                    if(file_exists('public/backend/media/xl/'.$old_file->file_name))
                    {
                        unlink(('public/backend/media/xl/'.$old_file->file_name));
                    }
                    if(file_exists('public/backend/media/original/'.$old_file->file_name))
                    {
                        unlink(('public/backend/media/original/'.$old_file->file_name));
                    }
                    echo 1;
                }else{
                    echo 0;
                }
            }else{
                echo 0;
            }
        }
    }
