<?php
    namespace App\Http\Controllers\Admin\developer;

    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use Illuminate\Support\Facades\DB;

    class optionMenusController extends Controller{
        public $data = [];
        public function __construct() {
            $this->middleware('auth:admin_logins');

            $this->data['aside_active']     = 'option_menu';
            $this->data['meta_keyword']     = "";
            $this->data['meta_description'] = "";

            /*get parent menu*/
            $this->data['aside_menu'] = DB::table('system_aside_menus')
                                        ->where(['has_option_menu'=>1, 'status'=>1])
                                        ->get();
        }


        /*form for new aside start _____________________________________*/
        public function create(){
            $this->data['nav_active']            = 'option_create';
            $this->data['aside_dropdown_active'] = 'option_create';


            return view('backend.pages.menus.option_menus.new')->with($this->data);
        }
        /*form for new aside end _____________________________________*/



        /*save new aside menu to database start _____________________________________*/
        public function store(Request $request){
            $request->validate([
                'aside_menu_id'         => 'required|max:4',
                'asidedropdown_menu_id' => 'required|max:4',
                'name'      => 'required|max:191',
                'type'      => 'required|max:191',
                'icon'      => 'required|max:191',
                'route_name'=> 'required|max:191'
            ]);

            $existance = DB::table('system_option_menus')
                         ->where([
                            ['aside_menu_id', '=', $request->aside_menu_id],
                            ['asidedropdown_menu_id', '=', $request->asidedropdown_menu_id],
                            ['name','=',$request->name]
                        ])
                         ->first();

            if($existance==true){
                set_msg('Name Already Taken !','danger');
                return redirect()->back();
            }


            $data = [
                'aside_menu_id'         =>$request->aside_menu_id,
                'asidedropdown_menu_id' =>$request->asidedropdown_menu_id,
                'name'      =>str_filter($request->name),
                'type'      =>$request->type,
                'route_name'=>$request->route_name,
                'icon'      =>$request->icon
            ];

            /*now insert data into database*/
            if(DB::table('system_option_menus')->insert($data)){
                set_msg("Aside Menu's Option Created Successfully !", 'success');
            }else{
                set_msg("Aside Menu's Option Not Created !", 'warning');
            }
            return redirect()->back();
        }
        /*save new aside menu to database end _____________________________________*/



        /*all aside menu start ________________________________________________________*/
        public function all(){
            $this->data['nav_active']            = 'option_list';
            $this->data['aside_dropdown_active'] = 'option_list';

            /*read all aside menu*/
            $this->data['rows'] = DB::table('system_option_menus')
                                  ->leftjoin('system_aside_menus', 'system_option_menus.aside_menu_id', '=', 'system_aside_menus.id')
                                  ->leftjoin('system_aside_menu_dropdowns', 'system_option_menus.asidedropdown_menu_id', '=', 'system_aside_menu_dropdowns.id')
                                  ->select('system_aside_menus.id as aside_menu_id', 'system_aside_menus.name as aside_menu_name', 'system_aside_menu_dropdowns.name as dropdown_menu_name', 'system_option_menus.*')
                                  ->where(['system_aside_menus.status'=>1, 'system_option_menus.status'=>1])
                                  ->get();

            return view('backend.pages.menus.option_menus.all')->with($this->data);
        }
        /*all aside menu end ________________________________________________________*/



        /*all_trash aside menu start ________________________________________________________*/
        public function all_trash(){
            $this->data['nav_active']            = 'option_trash';
            $this->data['aside_dropdown_active'] = 'option_trash';

            /*read all aside menu*/
            $this->data['rows'] = DB::table('system_option_menus')
                                  ->leftjoin('system_aside_menus', 'system_option_menus.aside_menu_id', '=', 'system_aside_menus.id')
                                  ->leftjoin('system_aside_menu_dropdowns', 'system_option_menus.asidedropdown_menu_id', '=', 'system_aside_menu_dropdowns.id')
                                  ->select('system_aside_menus.id as aside_menu_id', 'system_aside_menus.name as aside_menu_name', 'system_aside_menu_dropdowns.name as dropdown_menu_name', 'system_option_menus.*')
                                  ->where(['system_aside_menus.status'=>1, 'system_option_menus.status'=>0])
                                  ->get();

            return view('backend.pages.menus.option_menus.all_trash')->with($this->data);
        }
        /*all_trash aside menu end ________________________________________________________*/



        /*form for aside menu update start _________________________*/
        public function edit($id){
            $this->data['nav_active']            = 'option_list';
            $this->data['aside_dropdown_active'] = 'option_list';


            $this->data['result']      = DB::table('system_option_menus')
                                       ->where(['id'=>$id])->first();

            return view('backend.pages.menus.option_menus.edit')->with($this->data);
        }
        /*form for aside menu update end ______________________________*/



        /*aside menu update processing start __________________________*/
        public function edit_process(Request $request, $id){
            $request->validate([
                'aside_menu_id'         => 'required|max:4',
                'asidedropdown_menu_id' => 'required|max:4',
                'name'          => 'required|max:191',
                'type'          => 'required|max:191',
                'icon'          => 'required|max:191',
                'route_name'    => 'required|max:191'
            ]);


            $existance = DB::table('system_option_menus')
                         ->where([
                            ['id','!=',$id],
                            ['aside_menu_id', '=', $request->aside_menu_id],
                            ['asidedropdown_menu_id', '=', $request->asidedropdown_menu_id],
                            ['name','=',$request->name]])
                         ->first();

            if($existance==true){
                set_msg('Name Already Taken !','danger');
                return redirect()->back();
            }

            
            $data = [
                'aside_menu_id'         =>$request->aside_menu_id,
                'asidedropdown_menu_id' =>$request->asidedropdown_menu_id,
                'name'      =>str_filter($request->name),
                'type'      =>$request->type,
                'route_name'=>$request->route_name,
                'icon'      =>$request->icon
            ];



            /*now update data into database*/
            if(DB::table('system_option_menus')->where(['id'=>$id])->update($data)){
                set_msg("Aside Menu's Option Updated Successfully !", 'success');
            }else{
                set_msg("Aside Menu's Option Not Updated !", 'warning');
            }
            return redirect()->back();
        }
        /*aside menu update processing end _______________________________*/



        /*aside menu trash processing start ________________________________*/
        public function trash($id){
            $trash_status = DB::table('system_option_menus')
            ->where(['id'=>$id])
            ->update(['status'=>0]);

            if($trash_status){
                set_msg("Aside Menu's Option Deleted Successfully !", 'success');
            }else{
                set_msg("Aside Menu's Option Not Deleted !", 'warning');
            }
            return redirect()->back();
        }

        /*aside menu trash processing end ________________________________*/



        /*aside menu restore processing start ________________________________*/
        public function restore($id){
            $restore_status = DB::table('system_option_menus')
            ->where(['id'=>$id])
            ->update(['status'=>1]);

            if($restore_status){
                set_msg("Aside Menu's Option Restored From Trash Successfully !", 'success');
            }else{
                set_msg("Aside Menu's Option Not Restored From Trash !", 'warning');
            }
            return redirect()->back();
        }

        /*aside menu restore processing end ________________________________*/



        /*aside menu delete processing start ________________________________*/
        public function delete($id){
            $delete_status = DB::table('system_option_menus')
            ->where(['id'=>$id])
            ->delete();

            if($delete_status){
                set_msg("Aside Menu's Option Permanently Deleted !", 'success');
            }else{
                set_msg("Aside Menu's Option Permanently Not Deleted !", 'warning');
            }
            return redirect()->back();
        }

        /*aside menu delete processing end ________________________________*/


        /*get dropdown menu by ajax start ________________________________*/
        public function getDropdownMenuByAjax(){
            $aside_menu_id = $_GET['aside_menu_id'];

            $restore_status = DB::table('system_aside_menu_dropdowns')
            ->where(['aside_menu_id'=>$aside_menu_id])
            ->select('id', 'name')
            ->get();

            if(count($restore_status)>0){
                echo json_encode($restore_status);
            }else{
                echo 0;
            }
        }
        /*get dropdown menu by ajax end ________________________________*/
    }