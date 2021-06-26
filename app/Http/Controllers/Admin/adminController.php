<?php
    namespace App\Http\Controllers\Admin;

    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use Illuminate\Support\Facades\DB;
    use App\Helper\File_helper;
    use Illuminate\Support\Facades\Hash;

    class adminController extends Controller{
        public $data = [];
        public function __construct() {
            $this->middleware('auth:admin_logins');

            $this->data['top_nav']          = '.settings';//there should be a class name
            $this->data['meta_keyword']     = "";
            $this->data['meta_description'] = "";
        }


        /*form for create admin user start _____________________________________*/
        public function create(){
            $this->data['nav']              = '.create_admin';//there should be a class name
            $this->data['top_nav_dropdown'] = '.create_admin';//there should be a class name
            return view('backend.pages.admin.create')->with($this->data);
        }
        /*form for create admin user end _____________________________________*/



        /*save new admin database start _____________________________________*/
        public function store(Request $request){
            $request->validate([
                'name'       => 'required|max:191',
                'phone'      => 'required|max:191|unique:admins',
                'email'      => 'email|max:191|nullable|unique:admins',
                'admin_type' => 'required|max:191',
                'password'   => 'required|max:191|confirmed|min:6'
            ]);

            $data = [
                'created_at' =>date("Y-m-d H:i:s"),
                'updated_at' =>date("Y-m-d H:i:s"),
                'name'       =>$request->name,
                'phone'      =>$request->phone,
                'email'      =>$request->email,
                'address'    =>$request->address,
                'admin_type' =>$request->admin_type,
                'password'   =>Hash::make($request->password),
                'status'     =>1
            ];


            /*img upload processing start*/
            if(!is_null($request->img))
            {
                $img_name        = rand(0,9999999)."-".$request->username."_".time();
                $target_location = 'public/backend/img/profile';

                $path = File_helper::uploadImgWithResize($request, 'img', $request->img, $img_name, $target_location, 60, 400);
                $data['path'] = $path;
            }
            /*img upload processing end*/

            
            /*now insert data into database*/
            if(DB::table('admins')->insert($data)){
                set_msg("Admin Created Successfully !", 'success');
            }else{
                set_msg("Admin Not Created !", 'warning');
            }
            return redirect()->back();
        }
        /*save new admin database end _____________________________________*/



        /*all admin ________________________________________________________*/
        public function all(){
            $this->data['nav']              = '.all_admin';//there should be a class name
            $this->data['top_nav_dropdown'] = '.all_admin';//there should be a class name
            /*read all admin*/
            $this->data['rows'] = DB::table('admins')->get();

            return view('backend.pages.admin.all')->with($this->data);
        }
        /*all admin ________________________________________________________*/



        /*admin profile start _______________________________________________*/
        public function profile(Request $request){
            $this->data['nav']              = '.all_admin';//there should be a class name
            $this->data['top_nav_dropdown'] = '.all_admin';//there should be a class name

            $id = $request->id;

            /*read admin's info*/
            $this->data['rows'] = DB::table('admins')
                                  ->where(['id'=>$id,'status'=>1])
                                  ->get();
            return view('backend.pages.admin.profile')->with($this->data);
        }
        /*admin profile end _______________________________________________*/



        /*form for aside menu update start ________________________________________________*/
        public function edit($id){
            $this->data['nav']              = '.all_admin';//there should be a class name
            $this->data['top_nav_dropdown'] = '.all_admin';//there should be a class name

            //get admin's info
            $this->data['result'] = DB::table('admins')->where(['id'=>$id,"status"=>1])->first();
            
            return view('backend.pages.admin.edit')->with($this->data);
        }
        /*form for aside menu update end ________________________________________________*/



        /*aside menu update processing start ________________________________________________*/
        public function edit_process(Request $request, $id){
            $request->validate([
                'name'       => 'required|max:191',
                'admin_type' => 'required|max:191'
            ]);

            $existance = DB::table('admins')
                         ->where([
                            ['phone', '!=', $request->phone],
                            ['email', '!=', $request->email],
                            ['id', '!=', $id]
                         ])
                         ->first();

            if($existance==false){
                set_msg('Phone or Email Already Taken !','danger');
                return redirect()->back();
            }

            $data = [
                'name'        => $request->name,
                'phone'       => $request->phone,
                'email'       => $request->email,
                'address'     => $request->address,
                'admin_type'  => $request->admin_type
            ];

            /*img upload processing start*/
            if(!is_null($request->img)){
                $img_name        = rand(0,9999999)."-".$request->username."_".time();
                $target_location = 'public/backend/img/profile';

                $path = File_helper::uploadImgWithResize($request, 'img', $request->img, $img_name, $target_location, 60, 400);
                
                $data['path'] = $path;

                // delete old img
                $admin = DB::table('admins')
                     ->where(['id'=>$id,'status'=>1])
                     ->first();
                if($admin){
                    $old_path = $admin->path;
                    delete_single_img($old_path);
                }
            }
            /*img upload processing end*/


            /*now update data into database*/
            if(DB::table('admins')->where(['id'=>$id])->update($data)){
                set_msg("Admin's Information Updated Successfully !", 'success');
            }else{
                set_msg("Admin's Information Not Updated !", 'warning');
            }
            return redirect()->back();
        }
        /*aside menu update processing end ________________________________________________*/



        /*aside menu delete processing start ________________________________________________*/
        public function delete($id){
            $admin = DB::table('admins')
                     ->where(['id'=>$id,'status'=>1])
                     ->first();

            // delete admin data from database
            if(DB::table('admins')->where(['id'=>$id])->delete()){
                if($admin){
                    $path = $admin->path;
                    delete_img($path);
                }
                set_msg('success');
                set_msg("Admin Deleted Successfully !", 'success');
            }else{
                set_msg("Admin Not Deleted !", 'warning');
            }
            return redirect()->back();
        }

        /*aside menu delete processing end ________________________________________________*/



        function password_change(Request $request)
        {
            $this->validate($request, [
                'password' => 'required|confirmed|min:6',
            ]);

            /*check existance of current password start*/        
            $admin = \DB::table('admins')->where(['id' => $request->id])->first();
            
            $password_matched = Hash::check($request->current_password, $admin->password);
            
            if($password_matched)
            {
                $data = [
                    'password' => \Hash::make($request->password)
                ];
                
                if(\DB::table('admins')->where(['id' => $request->id])->update($data))
                {
                    set_msg('Password successfully changed!', 'success');
                }else{
                    set_msg('Password not changed!', 'warning');
                }
            }else{
                set_msg('Current Password Is Not Matched!', 'warning');
            }
            /* check existance of current password end */

            return redirect()->back();
        }
    }