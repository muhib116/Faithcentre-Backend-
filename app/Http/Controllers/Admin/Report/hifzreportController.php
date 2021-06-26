<?php
    namespace App\Http\Controllers\Admin\Report;

    use Illuminate\Http\Request;
    use App\Http\Controllers\Controller;
    use App\Helper\File_helper;
    use Illuminate\Support\Facades\DB;

    class hifzreportController extends Controller{
        public $data = [];
        public function __construct() {
            $this->middleware('auth:admin_logins');

            $this->data['meta_keyword']     = "";
            $this->data['meta_description'] = "";

            $this->data['students'] = \DB::table('students')
                                            ->where([
                                                'type'   => 'hifz',
                                                'status' => 1
                                            ])
                                            ->orderBy('name', 'asc')
                                            ->get();

            $this->data['teachers'] = \DB::table('admins')
                                            ->where([
                                                'status'=>1
                                            ])
                                            ->orderBy('name', 'asc')
                                            ->get();
        }

        /*all image in report start ___________________________________*/
        public function index()
        {
            $this->data['rows'] = DB::table('reports')
                                ->leftJoin('students', 'reports.student_id', 'students.id')
                                ->leftJoin('admins', 'reports.uploader_id', 'admins.id')
                                ->where([
                                    'reports.status'=>1
                                ])
                                ->orderBy('id', 'desc')
                                ->select('reports.*', 'students.name as student_name', 'admins.name as teacher_name')
                                ->get();

            return view('backend.pages.hifz_report.all')->with($this->data);
        }
        /*all image in report end _____________________________________*/


        /*add new image in report start ___________________________________*/
        public function create()
        {
            return view('backend.pages.hifz_report.new')->with($this->data);
        }
        /*add new image in report end _____________________________________*/



        /*save report image to database start _____________________________________*/
        public function store(Request $request)
        {
            $request->validate([
                'student_id'     => 'required',
                'student_type'   => 'required',
                'student_status' => 'required',
                'page_or_sura'   => 'required',
                'from'           => 'required',
                'to'             => 'required',
                'memorizing'     => 'required',
                'tajwid'         => 'required',
                'handwriting'    => 'required',
                'home_work_page_or_sura'=> 'required',
                'home_work_from'        => 'required',
                'home_work_to'          => 'required',
                'home_work_memorizing'  => 'required',
                'home_work_tajwid'      => 'required',
                'home_work_handwriting' => 'required',
            ]);


            $data = [
                'date'           => isset($request->date) ? $request->date : date('Y-m-d'),
                'time'           => date("H:i:s"),
                'updated_at'     => date("Y-m-d H:i:s"),
                'uploader_id'    => \Auth::id(),

                "student_id"     => $request->student_id,
                "student_type"   => $request->student_type,
                "student_status" => $request->student_status,

                "memorizing"     => $request->memorizing,
                "tajwid"         => $request->tajwid,
                "handwriting"    => $request->handwriting,

                "home_work_memorizing"  => $request->home_work_memorizing,
                "home_work_tajwid"      => $request->home_work_tajwid,
                "home_work_handwriting" => $request->home_work_handwriting,

                "remark"                => $request->remark,
                "star"                  => $request->star
            ];
            

            /*now insert data into database*/
            if($report_id = DB::table('reports')->insertGetId($data))
            {
                $page_or_sura = $request->page_or_sura;
                $from         = $request->from;
                $to           = $request->to;

                $home_work_page_or_sura = $request->home_work_page_or_sura;
                $home_work_from         = $request->home_work_from;
                $home_work_to           = $request->home_work_to;

                /*add current sabak start*/
                if(count($page_or_sura))
                {
                    foreach($page_or_sura as $index => $value)
                    {
                        $sabak_data = [
                            'report_id'    => $report_id,
                            'uploader_id'  => \Auth::id(),
                            "student_id"   => $request->student_id,

                            'page_or_sura' => $page_or_sura[$index],
                            'from'         => $from[$index],
                            'to'           => $to[$index]
                        ];

                        \DB::table('sabak_report')->insert($sabak_data);
                    }
                }
                /*add current sabak end*/


                /*add homework sabak start*/
                if(count($home_work_page_or_sura))
                {
                    foreach($home_work_page_or_sura as $index => $value)
                    {
                        $sabak_data = [
                            'report_id'    => $report_id,
                            'uploader_id'  => \Auth::id(),
                            "student_id"   => $request->student_id,

                            'page_or_sura' => $home_work_page_or_sura[$index],
                            'from'         => $home_work_from[$index],
                            'to'           => $home_work_to[$index],
                            'type'         => 'homework'
                        ];

                        \DB::table('sabak_report')->insert($sabak_data);
                    }
                }
                /*add homework sabak end*/


                set_msg("Report Information Uploaded Successfully !", 'success');
            }else{
                set_msg("Report Information Not Uploaded !", 'warning');
            }

            return redirect()->back();
        }
        /*save report image to database end _____________________________________*/



        /*report image update start ________________________________________________*/
        public function edit($id)
        {
            $reports = DB::table('reports')
                        ->where(['id'=>$id, 'status'=>1])
                        ->first();

            if($reports)
            {
                $sabak_data = DB::table('sabak_report')
                            ->where(['report_id'=>$id])
                            ->get();

                $reports->sabak = $sabak_data;
            }

            $this->data['result'] = $reports;

            return view('backend.pages.hifz_report.edit')->with($this->data);
        }
        /*report image update end ________________________________________________*/



        /*report image update processing start ________________________________________________*/
        public function edit_process(Request $request, $id)
        {
            $request->validate([
                'student_id'     => 'required',
                'student_type'   => 'required',
                'student_status' => 'required',
                'page_or_sura'   => 'required',
                'from'           => 'required',
                'to'             => 'required',
                'memorizing'     => 'required',
                'tajwid'         => 'required',
                'handwriting'    => 'required',
                'home_work_page_or_sura'=> 'required',
                'home_work_from'        => 'required',
                'home_work_to'          => 'required',
                'home_work_memorizing'  => 'required',
                'home_work_tajwid'      => 'required',
                'home_work_handwriting' => 'required',
            ]);

            $data = [
                'date'           => $request->date,
                'updated_at'     => date("Y-m-d H:i:s"),
                'uploader_id'    => \Auth::id(),
                "student_id"     => $request->student_id,

                "student_type"   => $request->student_type,
                "student_status" => $request->student_status,
                

                "memorizing"     => $request->memorizing,
                "tajwid"         => $request->tajwid,
                "handwriting"    => $request->handwriting,
                

                "home_work_memorizing"  => $request->home_work_memorizing,
                "home_work_tajwid"      => $request->home_work_tajwid,
                "home_work_handwriting" => $request->home_work_handwriting,

                "remark"                => $request->remark,
                "star"                  => $request->star
            ];

            
            /*now update data into database*/
            if(DB::table('reports')->where(['id'=>$id])->update($data))
            {

                // delete sabak report according to report id
                \DB::table('sabak_report')->where(['report_id'=>$id])->delete();


                $page_or_sura = $request->page_or_sura;
                $from         = $request->from;
                $to           = $request->to;

                $home_work_page_or_sura = $request->home_work_page_or_sura;
                $home_work_from         = $request->home_work_from;
                $home_work_to           = $request->home_work_to;

                /*add current sabak start*/
                if(count($page_or_sura))
                {
                    foreach($page_or_sura as $index => $value)
                    {
                        $sabak_data = [
                            'report_id'    => $id, //$id is report id
                            'uploader_id'  => \Auth::id(),
                            "student_id"   => $request->student_id,

                            'page_or_sura' => $page_or_sura[$index],
                            'from'         => $from[$index],
                            'to'           => $to[$index]
                        ];

                        \DB::table('sabak_report')->insert($sabak_data);
                    }
                }
                /*add current sabak end*/


                /*add homework sabak start*/
                if(count($home_work_page_or_sura))
                {
                    foreach($home_work_page_or_sura as $index => $value)
                    {
                        $sabak_data = [
                            'report_id'    => $id, //$id is report id
                            'uploader_id'  => \Auth::id(),
                            "student_id"   => $request->student_id,

                            'page_or_sura' => $home_work_page_or_sura[$index],
                            'from'         => $home_work_from[$index],
                            'to'           => $home_work_to[$index],
                            'type'         => 'homework'
                        ];

                        \DB::table('sabak_report')->insert($sabak_data);
                    }
                }
                /*add homework sabak end*/


                set_msg("Report Information Updated Successfully !", 'success');
            }else{
                set_msg("Report Information Not Updated !", 'warning');
            }

            return redirect()->back();
        }
        /*report image update processing end ________________________________________________*/


        /*report image in trash start ________________________________________________*/
        public function trash_list()
        {
            $this->data['rows'] = DB::table('reports')
                                ->leftJoin('students', 'reports.student_id', 'students.id')
                                ->leftJoin('admins', 'reports.uploader_id', 'admins.id')
                                ->where([
                                    'reports.status'=>0
                                ])
                                ->orderBy('id', 'desc')
                                ->select('reports.*', 'students.name as student_name', 'admins.name as teacher_name')
                                ->get();
                                    
            return view('backend.pages.hifz_report.trash')->with($this->data);
        }
        /*report image in trash end ________________________________________________*/



        /*report image trash processing start ________________________________________________*/
        public function trash(Request $request,$id){
            $delete_status = DB::table('reports')
                             ->where(['id'=>$id])
                             ->update(['status'=>0]);

            if($delete_status){
                set_msg("Report Sent To Trash Successfully !", 'success');
            }else{
                set_msg("Report Not Sent To Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*report image trash processing end ________________________________________________*/



        /*report image restore processing start ________________________________________________*/
        public function restore(Request $request,$id){
            $delete_status = DB::table('reports')
                             ->where(['id'=>$id])
                             ->update(['status'=>1]);
            
            if($delete_status){
                set_msg("Report Restore From Trash Successfully !", 'success');
            }else{
                set_msg("Report Not Restore From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*report image restore processing end ________________________________________________*/



        /*report image delete processing start ________________________________________________*/
        public function delete(Request $request,$id){
            $old_data      = DB::table('reports')
                                ->where(['id'=>$id])
                                ->first();

            $delete_status = DB::table('reports')
                             ->where(['id'=>$id])
                             ->delete();
            
            if($delete_status){
                set_msg("Report Permanently Deleted From Trash Successfully !", 'success');
            }else{
                set_msg("Report Not Permanently Deleted From Trash !", 'warning');
            }
            return redirect()->back();
        }
        /*report image delete processing end ________________________________________________*/





        /*report overview start*/
        public function overview()
        {
            $cond = [
                ['status', '=', 1],
            ];

            $report_data = DB::table('reports');


            if(isset($_GET['filter_data']))
            {
                $date = $_GET['filter_data'];
                $date = explode(':', $date);

                if(count($date)==2){
                    $infoType = $date[0];
                    $infoData = $date[1];

                    if($infoType == 'y')
                    {
                        $report_data = $report_data->whereYear('date', '=', $infoData);
                    }
                    elseif($infoType == 'm')
                    {
                        $report_data = $report_data->whereMonth('date', '=', $infoData);
                    }
                    elseif($infoType == 'date'){
                        $cond[] = ['date', '>=', $infoData];
                        $cond[] = ['date', '<=', date('Y-m-d')];
                    }
                }
            }else{
                $cond[] = ['date', '>=', extendDateOrTime(date('Y-m-d'), "-28 days")];
                $cond[] = ['date', '<=', date('Y-m-d')];
            }


            $report_data = $report_data->where($cond);
            $report_data = $report_data->orderBy('date', 'desc')
                                         ->select('star', 'student_id', 'date')
                                         ->get()
                                         ->groupBy('date');


            $chart_data = '';
            $label_data = '';

           if(count($report_data))
           {
                foreach ($report_data as $key => $value)
                {
                    $value->report_quantity = $report_quantity = count($value);
                    $value->date            = $date            = $value[0]->date;
                    
                    $totalStar = 0;
                    foreach($value as $k => $v)
                    {
                        $totalStar += $v->star;
                    }


                    $expected_star  = $report_quantity;
                    $collected_star = $totalStar;

                    $percentageOfStar = ($collected_star/($expected_star*total_star_for_reporting())) * 100;
                    $percentageOfStar = is_float($percentageOfStar) ? round($percentageOfStar, 2) : $percentageOfStar;

                    $chart_data .= ';'.$percentageOfStar;
                    $label_data .= ';'.date('d-M-y', strtotime($date));
                }
            }


            $this->data['chart_data'] = ltrim($chart_data, ';');
            $this->data['label_data'] = ltrim($label_data, ';');
            $this->data['rows']       = $report_data;

            return view('backend.pages.hifz_report.overview')->with($this->data);
        }



        public function single_overview($type, $id)
        {
            $fieldName = ($type == 'teacher') ? 'uploader_id' : 'student_id';

            $cond = [
                ['status',   '=', 1],
                [$fieldName, '=', $id]
            ];

            $report_data = DB::table('reports');


            if(isset($_GET['filter_data']))
            {
                $date = $_GET['filter_data'];
                $date = explode(':', $date);

                if(count($date)==2){
                    $infoType = $date[0];
                    $infoData = $date[1];

                    if($infoType == 'y')
                    {
                        $report_data = $report_data->whereYear('date', '=', $infoData);
                    }
                    elseif($infoType == 'm')
                    {
                        $report_data = $report_data->whereMonth('date', '=', $infoData);
                    }
                    elseif($infoType == 'date'){
                        $cond[] = ['date', '>=', $infoData];
                        $cond[] = ['date', '<=', date('Y-m-d')];
                    }
                }
            }else{
                $cond[] = ['date', '>=', extendDateOrTime(date('Y-m-d'), "-28 days")];
                $cond[] = ['date', '<=', date('Y-m-d')];
            }


            $report_data = $report_data->where($cond);
            $report_data = $report_data->orderBy('date', 'desc')
                                         ->select('star', 'student_id', 'date')
                                         ->get()
                                         ->groupBy('date');

            
            $chart_data = '';
            $label_data = '';

           if(count($report_data))
           {
                foreach ($report_data as $key => $value)
                {
                    $value->report_quantity = $report_quantity = count($value);
                    $value->date            = $date            = $value[0]->date;
                    
                    $totalStar = 0;
                    foreach($value as $k => $v)
                    {
                        $totalStar += $v->star;
                    }


                    $expected_star  = $report_quantity;
                    $collected_star = $totalStar;

                    $percentageOfStar = ($collected_star/($expected_star*total_star_for_reporting())) * 100;
                    $percentageOfStar = is_float($percentageOfStar) ? round($percentageOfStar, 2) : $percentageOfStar;

                    $chart_data .= ';'.($percentageOfStar);
                    $label_data .= ';'.date('d-M-y', strtotime($date));
                }
           }


            $this->data['chart_data'] = ltrim($chart_data, ';');
            $this->data['label_data'] = ltrim($label_data, ';');
            $this->data['rows']       = $report_data;

            $this->data['report_holder_name'] = $this->getHolderData($type, $id);
            $this->data['report_holder_type'] = $type;
            $this->data['report_holder_id']   = $id;

            return view('backend.pages.hifz_report.single_person_chart')->with($this->data);
        }


        private function getHolderData($type, $id)
        {
            if($type=='teacher')
            {
                $data = \DB::table('admins')->where(['status'=>1, 'id'=>$id])->select('name')->first();
            }else{
                $data = \DB::table('students')->where(['status'=>1, 'id'=>$id])->select('name')->first();
            }

            if($data)
            {
                return $data->name;
            }
            return 'Unknown';
        }
        /*report overview end*/





        /*ajax request process start*/
        function attendance_verifications($student_id)
        {
            $data   = date('Y-m-d');
            $result = \DB::table('reports')
                        ->where([
                            "date"       => $data,
                            "student_id" => $student_id
                        ])->first();

            if($result)
            {
                return json_encode('1');
            }

            return json_encode('0');
        }


        public function getStudents($student_type)
        {

            $students = \DB::table('students')
                            ->where([
                                'status'=>1,
                                'type'  => $student_type
                            ])
                            ->orderBy('name', 'asc')
                            ->select('id', 'name', 'type')
                            ->get()->toJson();

            return $students;
        }
        /*ajax request process end*/
    }