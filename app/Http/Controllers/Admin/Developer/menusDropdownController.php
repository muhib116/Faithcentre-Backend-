<?php
    namespace App\Http\Controllers\Admin\developer;

    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use Illuminate\Support\Facades\DB;

    class menusDropdownController extends Controller{
        public $data = [];
        public function __construct() {
            $this->middleware('auth:admin_logins');

            $this->data['aside_active']     = 'aside_dropdown_menu';
            $this->data['meta_keyword']     = "";
            $this->data['meta_description'] = "";

            /*get parent menu*/
            $this->data['system_aside_menus'] = DB::table('system_aside_menus')
                                            ->where(['has_sub_menu'=>1, 'status'=>1])
                                            ->get();
        }


        /*form for new aside start _____________________________________*/
        public function create(){
            $this->data['nav_active']            = 'aside_dropdown_create';
            $this->data['aside_dropdown_active'] = 'aside_dropdown_create';

            return view('backend.pages.menus.dropdown.new')->with($this->data);
        }
        /*form for new aside end _____________________________________*/



        /*save new aside menu to database start _____________________________________*/
        public function store(Request $request){
            $request->validate([
                'aside_menu_id' => 'required|max:4',
                'name'          => 'required|max:191',
                'route_name'    => 'required|max:191',
                'icon'          => 'required|max:191'
            ]);


            $existance = DB::table('system_aside_menu_dropdowns')
                         ->where([['aside_menu_id', '=', $request->aside_menu_id],['name','=',$request->name]])
                         ->first();

            if($existance==true){
                set_msg('Name Already Taken !','danger');
                return redirect()->back();
            }

            $data = [
                'aside_menu_id' =>$request->aside_menu_id,
                'name'      =>str_filter($request->name),
                'route_name'=>$request->route_name,
                'icon'      =>$request->icon,
                'status'    =>1
            ];

            /*now insert data into database*/
            if(DB::table('system_aside_menu_dropdowns')->insert($data)){
                set_msg("Aside Menu's Dropdown Created Successfully !", 'success');
            }else{
                set_msg("Aside Menu's Dropdown Not Created !", 'warning');
            }
            return redirect()->back();
        }
        /*save new aside menu to database end _____________________________________*/



        /*all aside menu start _______________________________________________*/
        public function all(){
            $this->data['nav_active']            = 'aside_dropdown_list';
            $this->data['aside_dropdown_active'] = 'aside_dropdown_list';

            /*read all aside menu*/
            $this->data['rows'] = DB::table('system_aside_menu_dropdowns')
                                  ->leftjoin('system_aside_menus', 'system_aside_menu_dropdowns.aside_menu_id', '=', 'system_aside_menus.id')
                                  ->select('system_aside_menus.id as aside_menu_id', 'system_aside_menus.name as parent_name', 'system_aside_menu_dropdowns.*')
                                  ->where(['system_aside_menu_dropdowns.status'=>1, 'system_aside_menus.status'=>1])
                                  ->get();

            return view('backend.pages.menus.dropdown.all')->with($this->data);
        }
        /*all aside menu end ___________________________________________________*/


        /*form for aside menu update start ________________________________________________*/
        public function edit($id){
            $this->data['nav_active']            = 'aside_dropdown_list';
            $this->data['aside_dropdown_active'] = 'aside_dropdown_list';

            $this->data['result']      = DB::table('system_aside_menu_dropdowns')
                                            ->where(['id'=>$id,'status'=>1])
                                            ->first();

            return view('backend.pages.menus.dropdown.edit')->with($this->data);
        }
        /*form for aside menu update end ________________________________________________*/



        /*aside menu update processing start _________________________________*/
        public function edit_process(Request $request, $id){
            $request->validate([
                'aside_menu_id'  => 'required|max:4',
                'name'           => 'required|max:191',
                'route_name'     => 'required|max:191',
                'icon'           => 'required|max:191'
            ]);

            $existance = DB::table('system_aside_menu_dropdowns')
                         ->where([['id','!=',$id],['aside_menu_id', '=', $request->aside_menu_id],['name','=',$request->name]])
                         ->first();

            if($existance==true){
                set_msg('Name Already Taken !','danger');
                return redirect()->back();
            }

            $data = [
                'aside_menu_id' =>$request->aside_menu_id,
                'name'      =>str_filter($request->name),
                'route_name'=>$request->route_name,
                'icon'      =>$request->icon
            ];

            /*now update data into database*/
            if(DB::table('system_aside_menu_dropdowns')->where(['id'=>$id, 'status'=>1])->update($data)){
                set_msg("Aside Menu's Dropdown Updated Successfully !", 'success');
            }else{
                set_msg("Aside Menu's Dropdown Not Updated !", 'warning');
            }
            return redirect()->back();
        }
        /*aside menu update processing end _________________________________________*/



        /*all_trash  aside menu start _______________________________________________*/
        public function all_trash (){
            $this->data['nav_active']            = 'aside_dropdown_trash';
            $this->data['aside_dropdown_active'] = 'aside_dropdown_trash';

            /*read all_trash  aside menu*/
            $this->data['rows'] = DB::table('system_aside_menu_dropdowns')
                                  ->leftjoin('system_aside_menus', 'system_aside_menu_dropdowns.aside_menu_id', '=', 'system_aside_menus.id')
                                  ->select('system_aside_menus.id as aside_menu_id', 'system_aside_menus.name as parent_name', 'system_aside_menu_dropdowns.*')
                                  ->where(['system_aside_menu_dropdowns.status'=>0, 'system_aside_menus.status'=>1])
                                  ->get();

            return view('backend.pages.menus.dropdown.all_trash ')->with($this->data);
        }
        /*all_trash  aside menu end ___________________________________________________*/


        /*aside menu trash processing start ____________________________________*/
        public function trash($id){
            $trash_status = DB::table('system_aside_menu_dropdowns')
            ->where(['id'=>$id])
            ->update(['status'=>0]);

            if($trash_status){
                set_msg("Aside Menu's Dropdown Deleted Successfully !", 'success');
            }else{
                set_msg("Aside Menu's Dropdown Not Deleted !", 'warning');
            }
            return redirect()->back();
        }
        /*aside menu trash processing end _______________________________________*/



        /*aside menu restore processing start ____________________________________*/
        public function restore($id){
            $restore_status = DB::table('system_aside_menu_dropdowns')
            ->where(['id'=>$id])
            ->update(['status'=>1]);

            if($restore_status){
                set_msg("Aside Menu's Dropdown Restore From Trash Successfully !", 'success');
            }else{
                set_msg("Aside Menu's Dropdown Not Restore From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*aside menu restore processing end _______________________________________*/



        /*aside menu delete processing start ____________________________________*/
        public function delete($id){
            $delete_status = DB::table('system_aside_menu_dropdowns')
            ->where(['id'=>$id])
            ->delete();

            if($delete_status){
                set_msg("Aside Menu's Dropdown Permanently Deleted !", 'success');
            }else{
                set_msg("Aside Menu's Dropdown Not Permanently Deleted !", 'warning');
            }
            return redirect()->back();
        }
        /*aside menu delete processing end _______________________________________*/
    }
