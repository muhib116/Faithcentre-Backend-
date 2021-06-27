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
            $this->data['rows'] = DB::table('hifz_reports')
                                ->leftJoin('students', 'hifz_reports.student_id', 'students.id')
                                ->leftJoin('admins', 'hifz_reports.uploader_id', 'admins.id')
                                ->where([
                                    'hifz_reports.status'=>1
                                ])
                                ->orderBy('id', 'desc')
                                ->select('hifz_reports.*', 'students.name as student_name', 'admins.name as teacher_name')
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



        /*save report data to database start _____________________________________*/
        public function store(Request $request)
        {
            $request->validate([
                'date'                  => 'required',
                'student_id'            => 'required',
                'student_status'        => 'required',
                'star'                  => 'required',
                'is_passed_sabak'       => 'required',
                'is_passed_seven_sabak' => 'required',
                'is_passed_rivision'    => 'required',

                'sabak_juz'             => 'required',
                'sabak_page'            => 'required',
                'sabak_line'            => 'required',

                'seven_sabak_juz'       => 'required',
                'seven_sabak_page_qnty' => 'required',

                'rivision_juz'          => 'required',
                'rivision_page_from'    => 'required',
                'rivision_page_to'      => 'required',
     
                'homework_sabak_juz'             => 'required',
                'homework_sabak_page'            => 'required',
                'homework_sabak_line'            => 'required',

                'homework_seven_sabak_juz'       => 'required',
                'homework_seven_sabak_page_qnty' => 'required',

                'homework_rivision_juz'          => 'required',
                'homework_rivision_page_from'    => 'required',
                'homework_rivision_page_to'      => 'required'
            ]);


            /*attendent existance check start*/
                $cond = [
                    'student_id' => $request->student_id,
                    'date'       => isset($request->date) ? $request->date : date('Y-m-d')
                ];

                if(\DB::table('hifz_reports')->where($cond)->exists()){
                    set_msg("This student's report already created !", 'warning');
                    return redirect()->back();
                }
            /*attendent existance check end*/


            $data = [
                'date'           => isset($request->date) ? $request->date : date('Y-m-d'),
                'time'           => date("H:i:s"),
                'updated_at'     => date("Y-m-d H:i:s"),
                'uploader_id'    => \Auth::id(),

                "student_id"     => $request->student_id,
                "student_status" => $request->student_status,

                "is_passed_sabak"       => $request->is_passed_sabak,
                "is_passed_seven_sabak" => $request->is_passed_seven_sabak,
                "is_passed_rivision"    => $request->is_passed_rivision,

                "remark"                => $request->remark,
                "star"                  => $request->star
            ];
            

            /*now insert data into database*/
                if($report_id = DB::table('hifz_reports')->insertGetId($data))
                {
                    // today's sabak
                    $sabak_status       = $this->add_sabak($request, $report_id,'sabak', 0);
                    $seven_sabak_status = $this->add_seven_sabak($request, $report_id,'seven_sabak', 0);
                    $rivision_status    = $this->add_rivision($request, $report_id,'rivision', 0);

                    // homework sabak
                    $homework_sabak_status       = $this->add_sabak($request, $report_id,'sabak', 1);
                    $homework_seven_sabak_status = $this->add_seven_sabak($request, $report_id,'seven_sabak', 1);
                    $homework_rivision_status    = $this->add_rivision($request, $report_id,'rivision', 1);


                    if(
                        $sabak_status && $seven_sabak_status && $rivision_status && 
                        $homework_sabak_status && $homework_seven_sabak_status && $homework_rivision_status
                    ){
                        set_msg("Report Information Uploaded Successfully !", 'success');
                    }else{
                        set_msg("Report not generated correctly !", 'danger');
                        $this->cleanupReportData($report_id);
                    }

                }else{
                    set_msg("Report Information Not Uploaded !", 'warning');
                }
            /*work with today's sabak end--------------------*/


            return redirect()->back();
        }
        /*save report data to database end _____________________________________*/












        /*report image update start ________________________________________________*/
            public function edit($id)
            {
                $reports = DB::table('hifz_reports')
                            ->where(['id'=>$id, 'status'=>1])
                            ->first();

                if($reports)
                {
                    $sabak_data = DB::table('hifz_sabak_report')
                                    ->where(['report_id'=>$id])
                                    ->get();

                    $reports->sabak = $sabak_data;
                }

                $this->data['result'] = $reports;

                return view('backend.pages.hifz_report.edit')->with($this->data);
            }
        /*report image update end ________________________________________________*/



        /*report image update processing start ________________________________________________*/
        public function edit_process(Request $request, $report_id)
        {
            $request->validate([
                'date'                  => 'required',
                'student_id'            => 'required',
                'student_status'        => 'required',
                'star'                  => 'required',
                'is_passed_sabak'       => 'required',
                'is_passed_seven_sabak' => 'required',
                'is_passed_rivision'    => 'required',

                'sabak_juz'         => 'required',
                'sabak_page'        => 'required',
                'sabak_line'        => 'required',

                'seven_sabak_juz'       => 'required',
                'seven_sabak_page_qnty' => 'required',

                'rivision_juz'      => 'required',
                'rivision_page_from'=> 'required',
                'rivision_page_to'  => 'required',
     
                'homework_sabak_juz'         => 'required',
                'homework_sabak_page'        => 'required',
                'homework_sabak_line'        => 'required',

                'homework_seven_sabak_juz'       => 'required',
                'homework_seven_sabak_page_qnty' => 'required',

                'homework_rivision_juz'      => 'required',
                'homework_rivision_page_from'=> 'required',
                'homework_rivision_page_to'  => 'required'
            ]);

            $data = [
                'date'           => isset($request->date) ? $request->date : date('Y-m-d'),
                'time'           => date("H:i:s"),
                'updated_at'     => date("Y-m-d H:i:s"),
                'uploader_id'    => \Auth::id(),

                "student_id"     => $request->student_id,
                "student_status" => $request->student_status,

                "is_passed_sabak"       => $request->is_passed_sabak,
                "is_passed_seven_sabak" => $request->is_passed_seven_sabak,
                "is_passed_rivision"    => $request->is_passed_rivision,

                "remark"                => $request->remark,
                "star"                  => $request->star
            ];
            

            /*now insert data into database*/
                if(DB::table('hifz_reports')->where(['id'=>$report_id])->update($data))
                {
                    // delete sabak report according to report_id
                    \DB::table('hifz_sabak_report')->where(['report_id'=>$report_id])->delete();

                    // today's sabak
                    $sabak_status       = $this->add_sabak($request, $report_id,'sabak', 0);
                    $seven_sabak_status = $this->add_seven_sabak($request, $report_id,'seven_sabak', 0);
                    $rivision_status    = $this->add_rivision($request, $report_id,'rivision', 0);

                    // homework sabak
                    $homework_sabak_status       = $this->add_sabak($request, $report_id,'sabak', 1);
                    $homework_seven_sabak_status = $this->add_seven_sabak($request, $report_id,'seven_sabak', 1);
                    $homework_rivision_status    = $this->add_rivision($request, $report_id,'rivision', 1);

                    if(
                        $sabak_status && $seven_sabak_status && $rivision_status && 
                        $homework_sabak_status && $homework_seven_sabak_status && $homework_rivision_status
                    ){
                        set_msg("Report Information Updated Successfully !", 'success');
                    }else{
                        $this->cleanupReportData($report_id);
                    }

                }else{
                    set_msg("Report Information Not Updated !", 'warning');
                }
            /*work with today's sabak end--------------------*/


            return redirect()->back();
        }
        /*report image update processing end ________________________________________________*/




        /*sabak report halper start===============================*/
            private function add_sabak($request, $report_id, $sabak_type, $is_homework)
            {
                /*add sabak data start*/

                    /*make ready data start*/
                    if(!$is_homework)
                    {
                        $sabak_juz  = $request->sabak_juz;
                        $sabak_page = $request->sabak_page;
                        $sabak_line = $request->sabak_line;
                    }else{
                        $sabak_juz  = $request->homework_sabak_juz;
                        $sabak_page = $request->homework_sabak_page;
                        $sabak_line = $request->homework_sabak_line;
                    }
                    /*make ready data end*/


                    $sabak_data = [
                        'uploader_id' => \Auth::id(),
                        "student_id"  => $request->student_id,
                        "report_id"   => $report_id,
                        "is_homework" => $is_homework,
                        'sabak_type'  => $sabak_type
                    ];


                    $insertStatus = false;

                    for ($i = 0; $i<count($sabak_juz); $i++)
                    {
                        $sabak_data['juz']         = $sabak_juz[$i];
                        $sabak_data['page_number'] = $sabak_page[$i];
                        $sabak_data['sabak_line']  = $sabak_line[$i];

                        if(DB::table('hifz_sabak_report')->insert($sabak_data))
                        {
                            $insertStatus = true;
                        }else{
                            set_msg("Something went wrong with ".($is_homework) ? 'homework' : 'today\'s'." sabak data !", 'danger');
                            return;
                        }
                    }

                    return $insertStatus;
                /*add sabak data end*/
            }

            private function add_seven_sabak($request, $report_id, $sabak_type, $is_homework)
            {
                /*add seven sabak data start*/
                    if(!$is_homework)
                    {
                        $seven_sabak_juz       = $request->seven_sabak_juz;
                        $seven_sabak_page_qnty = $request->seven_sabak_page_qnty;
                    }else{
                        $seven_sabak_juz       = $request->homework_seven_sabak_juz;
                        $seven_sabak_page_qnty = $request->homework_seven_sabak_page_qnty;
                    }


                    $sabak_data = [
                        'uploader_id' => \Auth::id(),
                        "student_id"  => $request->student_id,
                        "report_id"   => $report_id,
                        "is_homework" => $is_homework,
                        'sabak_type'  => $sabak_type
                    ];

                    $insertStatus = false;

                    for ($i = 0; $i<count($seven_sabak_juz); $i++)
                    {
                        $sabak_data['juz']       = $seven_sabak_juz[$i];
                        $sabak_data['page_qnty'] = $seven_sabak_page_qnty[$i];

                        if(DB::table('hifz_sabak_report')->insert($sabak_data))
                        {
                            $insertStatus = true;
                        }else{
                            set_msg("Something went wrong with ".($is_homework) ? 'homework' : 'today\'s'." seven sabak data !", 'danger');
                            return $insertStatus;
                        }
                    }

                    return $insertStatus;
                /*add sabak data end*/
            }

            private function add_rivision($request, $report_id, $sabak_type, $is_homework)
            {
                /*add seven rivision data start*/
                    if(!$is_homework)
                    {
                        $rivision_juz       = $request->rivision_juz;
                        $rivision_page_from = $request->rivision_page_from;
                        $rivision_page_to   = $request->rivision_page_to;
                    }else{
                        $rivision_juz       = $request->homework_rivision_juz;
                        $rivision_page_from = $request->homework_rivision_page_from;
                        $rivision_page_to   = $request->homework_rivision_page_to;
                    }


                    $rivision_data = [
                        'uploader_id' => \Auth::id(),
                        "student_id"  => $request->student_id,
                        "report_id"   => $report_id,
                        "is_homework" => $is_homework,
                        'sabak_type'  => $sabak_type
                    ];

                    $insertStatus = false;

                    for ($i = 0; $i<count($rivision_juz); $i++)
                    {
                        $rivision_data['juz']            = $rivision_juz[$i];
                        $rivision_data['page_number']    = $rivision_page_from[$i];
                        $rivision_data['page_number_to'] = $rivision_page_to[$i];

                        if(DB::table('hifz_sabak_report')->insert($rivision_data))
                        {
                            $insertStatus = true;
                        }else{
                            set_msg("Something went wrong with ".($is_homework) ? 'homework' : 'today\'s'." rivision data !", 'danger');
                            return $insertStatus;
                        }
                    }

                    return $insertStatus;
                /*add rivision data end*/
            }


            private function cleanupReportData($report_id)
            {
                // this method work when something went worng with any hifz report
                // this method delete all data to clean report, then redirect back

                \DB::table('hifz_reports')->where(['id'=>$report_id])->delete();
                \DB::table('hifz_sabak_report')->where(['report_id'=>$report_id])->delete();

                return redirect()->back();
            }
        /*sabak report halper start===============================*/




        /*report image in trash start ________________________________________________*/
        public function trash_list()
        {
            $this->data['rows'] = DB::table('hifz_reports')
                                ->leftJoin('students', 'hifz_reports.student_id', 'students.id')
                                ->leftJoin('admins', 'hifz_reports.uploader_id', 'admins.id')
                                ->where([
                                    'hifz_reports.status'=>0
                                ])
                                ->orderBy('id', 'desc')
                                ->select('hifz_reports.*', 'students.name as student_name', 'admins.name as teacher_name')
                                ->get();
                                    
            return view('backend.pages.hifz_report.trash')->with($this->data);
        }
        /*report image in trash end ________________________________________________*/



        /*report image trash processing start ________________________________________________*/
        public function trash(Request $request,$id){
            $delete_status = DB::table('hifz_reports')
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
            $delete_status = DB::table('hifz_reports')
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
            $old_data      = DB::table('hifz_reports')
                                ->where(['id'=>$id])
                                ->first();

            $delete_status = DB::table('hifz_reports')
                             ->where(['id'=>$id])
                             ->delete();

            
            if($delete_status)
            {
                // delete sabak report according to report_id
                \DB::table('hifz_sabak_report')->where(['report_id'=>$id])->delete();

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

            $report_data = DB::table('hifz_reports');


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

            $report_data = DB::table('hifz_reports');


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
            $result = \DB::table('hifz_reports')
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
        /*ajax request process end*/
    }