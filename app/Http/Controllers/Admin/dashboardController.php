<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Helper\File_helper;


class dashboardController extends Controller{
    public $data = [];
    public function __construct() {
        $this->middleware('auth:admin_logins');

        $this->data['aside_active']     = 'dashboard';
        $this->data['meta_keyword']     = "Deshboard"; //set meta keyword
        $this->data['meta_description'] = ""; //set meta description
    }

    public function index()
    {
        return view('backend.pages.dashboard')->with($this->data);
    }

    public function video()
    {
        $this->data['result'] = \DB::table('videos')->get();
        return view('backend.pages.videos')->with($this->data);
    }

    public function video_process(Request $request)
    {
        $video_code = $request->video_code;
        $video_code = explode('&', $video_code)[0];
        $video_code = explode('?v=', $video_code)[1];
        
        $data = [
            'video_code' => $video_code,
            'details'    => $request->details
        ];

        if(\DB::table('videos')->insert($data))
        {
            set_msg('Video added successfully!', 'success');
        }else{
            set_msg('Video not added!', 'warning');
        }
        return redirect()->back();
    }


    public function video_delete($id)
    {
        if(\DB::table('videos')->where(['id'=>$id])->delete())
        {
            set_msg('Video deleted successfully!', 'success');
        }else{
            set_msg('Video not deleted!', 'warning');
        }
        return redirect()->back();
    }



    /*contact_us start====================*/
        public function contact_us()
        {
            $this->data['contact_us'] = \DB::table('contact_us')->where(['status'=>1])->get();
            return view('backend.pages.contact_us')->with($this->data);
        }

        public function contact_us_all_trash()
        {
            $this->data['contact_us'] = \DB::table('contact_us')->where(['status'=>0])->get();
            return view('backend.pages.contact_us_all_trash')->with($this->data);
        }

        public function contact_us_replay($id)
        {
            $this->data['result'] = \DB::table('contact_us')->where(['id'=>$id])->first();
            return view('backend.pages.contact_us_replay')->with($this->data);
        }

        public function contact_us_replay_process(Request $request)
        {
            $to      = $request->send_to;
            $from    = $request->send_from;
            $subject = $request->subject;
            $replay  = $request->replay;

            if(send_email($from,$to,$subject,$replay))
            {
                set_msg('Replay sent successfully!', 'success');
            }else{
                set_msg('Replay not sent!', 'danger');
            }

            return redirect()->back();
        }

        public function contact_us_trash($id)
        {
            if(\DB::table('contact_us')->where(['id'=>$id])->update(['status'=>0]))
            {
                set_msg('Contact Info send to trash successfully!', 'success');
            }else{
                set_msg('Contact Info not send to trash!', 'danger');
            }

            return redirect()->back();
        }

        public function contact_us_restor($id)
        {
            if(\DB::table('contact_us')->where(['id'=>$id])->update(['status'=>1]))
            {
                set_msg('Contact Info restor from trash successfully!', 'success');
            }else{
                set_msg('Contact Info not restor from trash!', 'danger');
            }

            return redirect()->back();
        }

        public function contact_us_delete($id)
        {
            if(\DB::table('contact_us')->where(['id'=>$id])->delete())
            {
                set_msg('Video deleted successfully!', 'success');
            }else{
                set_msg('Video not deleted!', 'danger');
            }

            return redirect()->back();
        }
    /*contact_us end======================*/


    /*country module start-----------------*/
    function country()
    {
        $this->data['result'] = \DB::table('countries')->get();
        return view('backend.pages.country')->with($this->data);
    }

    function country_process(Request $request)
    {
        $data = ['name' => $request->name];

        if(\DB::table('countries')->insert($data))
        {
            set_msg('Country Created Successfully', 'success');
        }else{
            set_msg('Country Not Created', 'warning');
        }

        return redirect()->back();
    }

    function country_delete($id)
    {
        if(\DB::table('countries')->where(['id'=>$id])->delete())
        {
            set_msg('Country Deleted Successfully', 'success');
        }else{
            set_msg('Country Not Deleted', 'warning');
        }

        return redirect()->back();
    }
    /*country module end-------------------*/
}
