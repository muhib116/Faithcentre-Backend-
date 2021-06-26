<?php
    namespace App\Http\Controllers\Admin;

    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use Illuminate\Support\Facades\DB;
    use Auth;

    class privilegeController extends Controller{
        public $data = [];
        
        public function __construct() {
            $this->middleware('auth:admin_logins');

            $this->data['aside']            = '.privilege_menue';//there should be a class name
            $this->data['meta_keyword']     = "";
            $this->data['meta_description'] = "";
        }
        
        public function index() {
            $this->data['nav']           = '';//there should be a class name
            $this->data['asideDropdown'] = '';//there should be a class name

            return view('backend/pages/privilege/set_privilege')->with($this->data);
        }

        public function store(Request $request) {
            $data = [
                'created_at'             =>date("Y-m-d H:i:s"),
                'updated_at'             =>date("Y-m-d H:i:s"),
                'admin_id'               => $request->admins_id,
                'aside_menu_id'          => (json_encode($request->aside_menu_id) != null) ? json_encode($request->aside_menu_id) : '[]',
                'aside_menu_dropdown_id' => (json_encode($request->aside_menu_dropdown_id) != null) ? json_encode($request->aside_menu_dropdown_id) : '[]',
                'option_menu_id'         => (json_encode($request->option_menu_id) != null) ? json_encode($request->option_menu_id) : '[]'
            ];
            if(DB::table('admin_privileges')->insert($data)){
                set_msg('Privilege Successfully Saved!', 'success');
            }else{
                set_msg('Privilege Not Saved','warning');
            }
            return redirect()->back();
        }

        public function update(Request $request) {
            $data = [
                'updated_at'             => date("Y-m-d H:i:s"),
                'aside_menu_id'          => (json_encode($request->aside_menu_id) != null ) ? json_encode($request->aside_menu_id) : '[]',
                'aside_menu_dropdown_id' => (json_encode($request->aside_menu_dropdown_id) != null) ? json_encode($request->aside_menu_dropdown_id) : '[]',
                'option_menu_id'         => (json_encode($request->option_menu_id)) ? json_encode($request->option_menu_id) : '[]'
            ];
            
            $id = $request->admins_id;
            if(DB::table('admin_privileges')->where(['admin_id'=>$id])->update($data)){
                set_msg('Privilege Successfully Updated!', 'success');
            }else{
                set_msg('Privilege Not Updated','warning');
            }
            return redirect()->back();
        }
        
    }