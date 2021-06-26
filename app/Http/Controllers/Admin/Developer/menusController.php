<?php
    namespace App\Http\Controllers\Admin\developer;

    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use Illuminate\Support\Facades\DB;

    class menusController extends Controller{
        public $data = [];
        public function __construct() {
            $this->middleware('auth:admin_logins');

            $this->data['aside_active']     = 'aside_menu';
            $this->data['meta_keyword']     = "buttons,btns,html btn,html and css btn";
            $this->data['meta_description'] = "This is button";
        }


        /*form for new aside start _____________________________________*/
        public function create(){
            $this->data['nav']                   = 'aside_create';
            $this->data['aside_dropdown_active'] = 'aside_create';
            return view('backend.pages.menus.aside.new')->with($this->data);
        }
        /*form for new aside end _____________________________________*/



        /*save new aside menu to database start _____________________________________*/
        public function store(Request $request){
            $request->validate([
                'name'     => 'required|unique:system_aside_menus|max:191',
                'icon'     => 'required|max:191'
            ]);

            $data = [
                'name'=>str_filter($request->name),
                'route_name'=>$request->route_name,
                'icon'=>$request->icon
            ];

            if(empty($request->has_sub_menu)){
                $data['has_sub_menu'] = 0;
            }

            if(empty($request->has_option_menu)){
                $data['has_option_menu'] = 0;
            }

            /*now insert data into database*/
            if(DB::table('system_aside_menus')->insert($data)){
                set_msg("Aside Menu Created Successfully !", 'success');
            }else{
                set_msg("Aside Menu Not Created !", 'warning');
            }
            return redirect()->back();
        }
        /*save new aside menu to database end _____________________________________*/



        /*all aside menu start ________________________________________________________*/
        public function all(){
            $this->data['nav']                   = 'aside_list';
            $this->data['aside_dropdown_active'] = 'aside_list';

            /*read all aside menu*/
            $this->data['rows'] = DB::table('system_aside_menus')
                                  ->where(['status'=>1])
                                  ->get();

            return view('backend.pages.menus.aside.all')->with($this->data);
        }
        /*all aside menu end ______________________________________*/


        /*form for aside menu update start ________________________________________________*/
        public function edit($id){
            $this->data['nav']                   = 'aside_list';
            $this->data['aside_dropdown_active'] = 'aside_list';

            /*get single menu*/
            $this->data['result'] = DB::table('system_aside_menus')->where(['id'=>$id,'status'=>1])->first();

            return view('backend.pages.menus.aside.edit')->with($this->data);
        }
        /*form for aside menu update end ________________________________________________*/



        /*aside menu update processing start ________________________________________________*/
        public function edit_process(Request $request, $id){
            $request->validate([
                'name'     => 'required|max:191',
                'icon'     => 'required|max:191'
            ]);

            $existance = DB::table('system_aside_menus')
                         ->where([['id', '!=', $id],['name', '=', $request->name]])
                         ->first();

            if($existance==true){
                set_msg('Name Already Taken !','danger');
                return redirect()->back();
            }

            $data = [
                'name'      =>str_filter($request->name),
                'route_name'=>$request->route_name,
                'icon'      =>$request->icon
            ];

            if($request->has_sub_menu==false){
                $data['has_sub_menu'] = 0;
            }else{
                $data['has_sub_menu'] = 1;
            }

            if($request->has_option_menu==false){
                $data['has_option_menu'] = 0;
            }else{
                $data['has_option_menu'] = 1;
            }


            /*now update data into database*/
            if(DB::table('system_aside_menus')->where(['id'=>$id,'status'=>1])->update($data)){
                set_msg("Aside Menu Updated Successfully !", 'success');
            }else{
                set_msg("Aside Menu Not Updated !", 'warning');
            }
            return redirect()->back();
        }
        /*aside menu update processing end ________________________________________________*/




        /*all_trash aside menu start ___________________________________*/
        public function all_trash(){
            $this->data['nav']                   = 'aside_trash';
            $this->data['aside_dropdown_active'] = 'aside_trash';

            /*read all_trash aside menu*/
            $this->data['rows'] = DB::table('system_aside_menus')
                                  ->where(['status'=>0])
                                  ->get();

            return view('backend.pages.menus.aside.all_trash')->with($this->data);
        }
        /*all_trash aside menu end ______________________________________*/


        /*aside menu send to trash processing start ________________________________________________*/
        public function trash($id, $submenu_status, $option_menu_status){
            if($submenu_status==0 && $option_menu_status==0){
                // aside menu process start_____________
                $trash_status = DB::table('system_aside_menus')
                ->where(['id'=>$id])
                ->update(['status'=>0]);

                if($trash_status){
                    set_msg("Aside Menu Deleted Successfully !", 'success');
                }else{
                    set_msg("Aside Menu Not Deleted !", 'warning');
                }
                // aside menu process end_____________
            }else{

                /*send aside dropdown menu to trash*/
                if($submenu_status==1){
                    /*update status from 'aside_menu_dropdowns' table*/
                    $trash_status = DB::table('system_aside_menu_dropdowns')
                    ->where(['aside_menu_id'=>$id])
                    ->update(['status'=>0]);
                }

                /*send option's menu to trash*/
                if($option_menu_status==1){
                    /*update status from 'option_menus' table*/
                    $trash_status = DB::table('system_option_menus')
                    ->where(['aside_menu_id'=>$id])
                    ->update(['status'=>0]);
                }

                $trash_status = DB::table('system_aside_menus')
                ->where(['id'=>$id])
                ->update(['status'=>0]);

                if($trash_status){
                    set_msg("Aside Menu Deleted Successfully !", 'success');
                }else{
                    set_msg("Aside Menu Not Deleted !", 'warning');
                }
            }
            return redirect()->back();
        }

        /*aside menu send to trash processing end _______________________________________*/




        /*aside menu restore from restore processing start ________________________________________________*/
        public function restore($id, $submenu_status, $option_menu_status){
            if($submenu_status==0 && $option_menu_status==0){
                // aside menu process start_____________
                $restore_status = DB::table('system_aside_menus')
                ->where(['id'=>$id])
                ->update(['status'=>1]);

                if($restore_status){
                    set_msg("Aside Menu Restore From Trash Successfully !", 'success');
                }else{
                    set_msg("Aside Menu Not Restore From Trash !", 'warning');
                }
                // aside menu process end_____________
            }else{

                /*send aside dropdown menu to restore*/
                if($submenu_status==1){
                    /*update status from 'aside_menu_dropdowns' table*/
                    $restore_status = DB::table('system_aside_menu_dropdowns')
                    ->where(['aside_menu_id'=>$id])
                    ->update(['status'=>1]);
                }

                /*send option's menu to restore*/
                if($option_menu_status==1){
                    /*update status from 'option_menus' table*/
                    $restore_status = DB::table('system_option_menus')
                    ->where(['aside_menu_id'=>$id])
                    ->update(['status'=>1]);
                }

                $restore_status = DB::table('system_aside_menus')
                ->where(['id'=>$id])
                ->update(['status'=>1]);

                if($restore_status){
                    set_msg("Aside Menu Restore From Trash Successfully !", 'success');
                }else{
                    set_msg("Aside Menu Not Restore From Trash !", 'warning');
                }
            }
            return redirect()->back();
        }

        /*aside menu restore from restore processing end _______________________________________*/



        /*aside menu delete processing start ______________________________________*/
        public function delete($id, $submenu_status, $option_menu_status){
            if($submenu_status==0 && $option_menu_status==0){
                $delete_status = DB::table('system_aside_menus')
                ->where(['id'=>$id])
                ->delete();

                if($delete_status){
                    set_msg("Aside Menu Permanently Deleted !", 'success');
                }else{
                    set_msg("Aside Menu Not Permanently Deleted !", 'warning');
                }
            }else{

                /*delete option's menu*/
                if($option_menu_status==1){
                    /*delete data from 'option_menus' table*/
                    $delete_status = DB::table('system_option_menus')
                    ->where(['aside_menu_id'=>$id])
                    ->delete();
                }
                
                /*delete aside dropdown menu*/
                if($submenu_status==1){
                    /*delete data from 'aside_menu_dropdowns' table*/
                    $delete_status = DB::table('system_aside_menu_dropdowns')
                    ->where(['aside_menu_id'=>$id])
                    ->delete();
                }

                /*delete aside menue*/
                $delete_status = DB::table('system_aside_menus')
                ->where(['id'=>$id])
                ->delete();

                if($delete_status){
                    set_msg("Aside Menu Permanently Deleted !", 'success');
                }else{
                    set_msg("Aside Menu Not Permanently Deleted !", 'warning');
                }
            }
            return redirect()->back();
        }

        /*aside menu delete processing end _____________________________________*/




        /*sort aside menu start ______________________________________*/
        public function sort(){
            $this->data['nav']                   = 'sort_aside_menu';
            $this->data['aside_dropdown_active'] = 'sort_aside_menu';

            /*read all_trash aside menu*/
            $this->data['rows']  =  DB::table('system_aside_menus')
                                    ->where(['status'=>1])
                                    ->orderBy('position', 'asc')
                                    ->get();

            return view('backend.pages.menus.aside.sort')->with($this->data);
        }

        public function sortByAjax(){
            $id_position = $_GET['id_position'];
            $id_position = str_replace('{"', "", $id_position);
            $id_position = str_replace('"}', "", $id_position);

            $id_position = explode('","', $id_position);

            foreach ($id_position as $key => $value) {
                $id_position_arr = explode('":"', $value);
                $id       = $id_position_arr[0];
                $position = $id_position_arr[1];

                if(DB::table("system_aside_menus")->where(['id'=>$id])->update(['position'=>$position])){
                    echo 1;
                }
            }

            // print_r($id_position);
        }
        /*sort aside menu end ________________________________________*/
    }
