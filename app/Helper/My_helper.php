<?php
    use App\Helper\File_helper;

    /** */
    /*কি ভাবে কাস্টম হেল্পার তৈরি করব?
    /*------------------------------------
    /*প্রথমেই আমাদেরকে app ফোল্ডারের ভিতরে হেল্পার তৈরি করতে হবে। এটি আলদা কোন ফোল্ডারের ভিতরে হতে পারে 
    /*অথবা সরাসরি app ফোল্ডারের ভিতরে হতে পারে।
    /*আমরা এই খানে app ফোল্ডারের ভিতরে Helper নামে একটি ফোল্ডার তৈরি করেছি তার ভিতরে আমরা My_helper.php 
    /*নামে একটি ফাইল তৈরি করে ছি এটি মূলত আমাদের custom helper ফাইল।
    /*এর ভিতরে যে সকল function থাকবে সে গুলোকে এই project এর যে কোন জায়গা থেকে access যাবে।
    /*অবশ্য তার আগে আমাদেরকে আরও কিছু কাজ করে নিতে হবেঃ
    /*১)composer.json ফাইলটি খুলে এর ভিতরে আমাদের হেল্পারটিকে লোড করাতে হবে নিচের মত করেঃ-
        
        "autoload": {
            "files": [
            --------------
                "app/Helper/My_helper.php"
                ---------------------------
            ],
            --------------------------------
            "psr-4": {
                "App\\": "app/"
            },
            "classmap": [
                "database/seeds",
                "database/factories"
            ]
        },

    /*উপরের কোডে যেই লাইন গুলোর নিচে ডেশ ডেশ আছে সেই গুলো লেখে হেল্পারটি লোড করাতে হবে।
    /*২) এখন আমাদেরকে আমাদের project এর ফোল্ডারটি ওপেন করে cmd/git open করে নিচের command টি
    /*রান করাতে হবে, রান হওয়া সফল ভাবে শেষ হলেই আমাদের কাজ শেষ।
        composer dump-autoload
    /*
    /** */

    /*this method is available in everywhere in this project*/
   
    /*peramiter: msg,type,title,name*/
    function set_msg($msg="This is alert.", $type='alert!',$name='msg'){
        $icon = '';
        if($type=='success'){
            $icon = "<i class='fa fa-check'></i>";
        }
        if($type=='info'){
            $icon = '<i class="fa fa-info-circle" aria-hidden="true"></i>';
        }
        if($type=='warning'){
            $icon = "<i class='fa fa-exclamation-triangle'></i>";
        }
        if($type=='danger'){
            $icon = "<i class='fa fa-close'></i>";
        }
        if($type=='alert'){
            $type = "primary";
            $icon = "<i class='fa fa-envelope'></i>";
        }

        $msg = '<div class="alert alert-'.$type.'" style="display: flex;align-items: center;">
                    <div class="icon" style="margin-right: 15px;">'
                        .$icon.
                    '</div>
                    <div>
                        <div>
                            <strong>'
                                .ucfirst($type).
                            '!</strong> <br>
                        </div>
                        <div class="content">'
                            .$msg.
                        '</div>
                    </div>
                </div>';
        return session()->flash($name, $msg);
    }

    function msg($name='msg'){
        return session($name);
    }


    /*peramiter: msg,type,title*/
    function alert($msg="This is alert.", $type='alert'){
        $icon = '';
        if($type=='success'){
            $icon = "<i class='fa fa-check'></i>";
        }
        if($type=='info'){
            $icon = '<i class="fa fa-info-circle" aria-hidden="true"></i>';
        }
        if($type=='warning'){
            $icon = "<i class='fa fa-exclamation-triangle'></i>";
        }
        if($type=='danger'){
            $icon = "<i class='fa fa-close'></i>";
        }
        if($type=='alert'){
            $type = "primary";
            $icon = "<i class='fa fa-envelope'></i>";
        }

        $msg = '<div class="alert alert-'.$type.'" style="display: flex;align-items: center;">
                    <div class="icon">'
                        .$icon.
                    '</div>
                    <div>
                        <div>
                            <strong>'
                                .ucfirst($type).
                            '!</strong> <br>
                        </div>
                        <div class="content">'
                            .$msg.
                        '</div>
                    </div>
                </div>';
        echo $msg;
    }



    /* this function calling from header <meta name="author" content="{{ author() }}">*/
    function author(){
        return "Muhibbullah Ansary";
    }


    /*laravel validation error viewer start*/
    function validation_msg($errors){
        $error_list='';
        foreach ($errors as $key => $error){
            $error_list .= "<li>".($key+1).": ".$error."</li>";
        }
        echo "<div class='alert alert-danger' style='display: flex;align-items: center;''>
                <div class='icon'>
                    <i class='fa fa-warning' aria-hidden='true'></i>
                </div>
                <div>
                    <div>
                        <strong>
                            Error !
                        </strong> <br>
                    </div>
                    <div class='content'>
                        <ul>".$error_list."</ul>
                    </div>
                </div>
            </div>";
    }
    /*laravel validation error viewer end*/



    // ------------------------------------------------------------------------
    // delete file from json path list start
    function delete_file($path){
        delete_img($path);
    }
    // delete file from json path list end

    // delete image from json path list start
    function delete_img($path){
        $path = json_decode($path);
        // $path will be single path or path of array
        return File_helper::deleteFile($path);
    }
    // delete image from json path list end
    // ------------------------------------------------------------------------


    // ------------------------------------------------------------------------
    // delete single file from json path list start
    function delete_single_file($path){
        delete_img($path);
    }
    // delete single file from json path list end

    // delete single image from json path list start
    function delete_single_img($path){
        // $path will be single path or path of array
        return File_helper::deleteFile($path);
    }
    // delete single image from json path list end
    // ------------------------------------------------------------------------



    // this method use for showing lazy load image start
    function lazy_load_path(){
        return asset("public/backend/img/lazy_load.gif");
    }
    // this method use for showing lazy load image end


    // this method use for showing default image start
    function default_path(){
        return asset("public/backend/img/img_not_found.png");
    }
    // this method use for showing default image end


    // this method for checking !empty(), !="null", isset(), !is_null()
    function is_safe($data){
        return (isset($data) && !empty($data) && !is_null($data) && $data !== 'null') ? true : false;
    }

    function str_filter($str){
        return trim(strip_tags($str));
    }

    function shuffle_str($value=''){
        return str_shuffle("abcdefghijklmnopqrstuvwxyz_1234567890");
    }


    // dynamic system maintainence start------------------------------------------------------------
    function system_id(){
        if(isset($_GET['system'])){
            $system        = base64_decode($_GET['system']);
            $system        = explode('_',$system);
            $aside_menu_id = $dropdown_menu_id = '';


            if(is_safe($system[0])){
              $aside_menu_id = $system[0];
            }

            if(isset($system[1]) && is_safe($system[1])){
              $dropdown_menu_id = $system[1];
            }
            return ["aside_id"=>$aside_menu_id,"aside_dropdown_id"=>$dropdown_menu_id];
        }
    }

    function get_system_id(){
        // get system id
        $aside_id           = system_id()["aside_id"];
        $aside_dropdown_id  = system_id()["aside_dropdown_id"];
        return base64_encode($aside_id."_".$aside_dropdown_id);
    }

    function get_system(){
        // get system id
        $aside_id           = system_id()["aside_id"];
        $aside_dropdown_id  = system_id()["aside_dropdown_id"];
        return "?system=".base64_encode($aside_id."_".$aside_dropdown_id);
    }

    function get_action_menu(){
        // this system_id method calling from my_helper.php
        $aside_id          = system_id()["aside_id"];
        $aside_dropdown_id = system_id()["aside_dropdown_id"];


        // get user data to check privilege start
        $logedInUserId = Auth::id();
        $userInfo = \DB::table('admins')
                    ->leftJoin('admin_privileges', 'admins.id','=','admin_privileges.admin_id')
                    ->select(
                        'admins.admin_type as admin_type',
                        'admin_privileges.option_menu_id as option_menu_id'
                    )
                    ->where(['admins.id'=>$logedInUserId])
                    ->first();
        // get user data to check privilege end

        $action_menue = \DB::table('system_option_menus')->where(['aside_menu_id'=>$aside_id, 'asidedropdown_menu_id'=>$aside_dropdown_id, 'status'=>1])->get();
        return ["userInfo"=>$userInfo,"action_menue"=>$action_menue];
    }
    // dynamic system maintainence end------------------------------------------------------------


    // this method return current url start----------------------------------------------------------
    function current_url(){
        return (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
    }
    // this method return current url end------------------------------------------------------------



    /*this method return user's ip address start----------------------------*/
    function get_client_ip() {
        $ipaddress = '';
        if (getenv('HTTP_CLIENT_IP')){
            $ipaddress = getenv('HTTP_CLIENT_IP');
        }else if(getenv('HTTP_X_FORWARDED_FOR')){
            $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
        }else if(getenv('HTTP_X_FORWARDED')){
            $ipaddress = getenv('HTTP_X_FORWARDED');
        }else if(getenv('HTTP_FORWARDED_FOR')){
            $ipaddress = getenv('HTTP_FORWARDED_FOR');
        }else if(getenv('HTTP_FORWARDED')){
            $ipaddress = getenv('HTTP_FORWARDED');
        }else if(getenv('REMOTE_ADDR')){
            $ipaddress = getenv('REMOTE_ADDR');
        }else{
            $ipaddress = 'UNKNOWN';
        }
        return $ipaddress;
    }
    /*this method return user's ip address end------------------------------*/


    /*bulk sms send method start--------------------------------------------*/
    function send_sms($number=NULL, $message=NULL){        
        $username = "01770989591";
        $password = "";
        try{
            $soapClient = new SoapClient("http://api.onnorokomsms.com/sendsms.asmx?wsdl");
            $paramArray = array(
            'userName'     => $username,
            'userPassword' => $password,
            'mobileNumber' => $number,
            'smsText'      => $message,
            'type'         => "TEXT",
            'maskName'     => "",
            'campaignName' => ''
            );

            $value = $soapClient->__call("OneToOne", array($paramArray));
            $value->OneToOneResult;
        }catch(Exception $e) {
            echo $e;
        }
    }
    /*bulk sms send method end----------------------------------------------*/


    // show image from json path list start
        function show_img($path, $attr='alt="Lazy Loader"', $index=null, $lazy_load='public/backend/img/lazy_load.svg', $img_not_found="public/backend/img/img_not_found.svg"){
            $path = json_decode($path);
            $img_list = '';
            if($index===null){
                foreach($path as $key => $value){
                    $img_list .= '<img class="man_lazy" '.$attr.' src="'.asset($lazy_load).'" data-src="'.asset(file_exists($value) ? $value : $img_not_found).'" '.$attr.' >';
                }
            }else{
                $img_list = '<img class="man_lazy" '.$attr.' src="'.asset($lazy_load).'" data-src="'.asset((isset($path[$index]) && file_exists($path[$index])) ? $path[$index] : $img_not_found).'" '.$attr.' >';
            }
            echo $img_list;
        }
        // show image from json path list end


        // show single image from json path list start
        function show_single_img($path, $attr='alt="Lazy Loader"', $lazy_load="public/backend/img/lazy_load.svg", $img_not_found="public/backend/img/img_not_found.svg"){
            $path = json_encode(array($path));
            show_img($path, $attr, null, $lazy_load, $img_not_found);
        }
        // show single image from json path list end


        // show multilayar lazy load image start
        function show_img_multiple_chanal_lazyLoad($path, $attr='alt="Lazy Loader"', $lazy_load='public/backend/img/lazy_load.svg', $img_not_found="public/backend/img/img_not_found.svg")
        {
            $path = explode(',', $path);

            $imgPath = '';
            foreach ($path as $key => $value) {
                $imgPath .= asset($value).',';
            }

            $imgPath = rtrim($imgPath,",");


            echo '<img class="man_lazy" '.$attr.' src="'.asset($lazy_load).'" data-src="'.$imgPath.'" '.$attr.' >';
        }
        // show multilayar lazy load image end




    function get_secret_number($number)
    {
        $secret_number = ["0"=>"z","1"=>"o","2"=>"t","3"=>"3","4"=>"f","5"=>"5","6"=>"s","7"=>"7","8"=>"e","9"=>"n", '.'=>'.'];
        $x             = '';

        for($i=0; $i<strlen($number); $i++){
            if(isset($number[$i])){
                $index = $number[$i];
                $x .= $secret_number[$index];
            }
        }
        return $x;
    }


    function make_short($text, $limit = 400)
    {
        $text = $text. " ";
        $text = substr($text, 0, $limit);
        $text = substr($text, 0, strrpos($text, ' '));
        $text = $text.".....";
        return $text;
    }
    

    function student_type(){
        return ['qaidah', 'juz amma', 'quran', 'hifz'];
    }

    function quran_suras(){
        return ["al-fatiha","al-baqara","al-baqara","al-baqara","aal-imran","aal-imran","an-nisa","an-nisa","an-nisa","al-maeda","al-maeda","al-anaam","al-anaam","al-araf","al-araf","al-anfal","al-anfal","at-taubah","at-taubah","younus","hood","hood","yusuf","yusuf","ar-ra'ad","ibrahim","al-hijr","an-nahl","al-isra","al-kahf","al-kahf","maryam","taha","al-anbiya","al-hajj","al-muminoon","al-noor","al-furqan","al-furqan","ash-shu'ara","an-naml","an-naml","al-qasas","al-ankaboot","ar-room","luqman","as-sajda","al-ahzab","al-ahzab","as-saba","fatir","yaseen","yaseen","as-saaffat","saad","al-zumar","al-zumar","ghafir","fussilat","fussilat","ash-shura","az-zukhruf","al-dukhan","al-jathiya","al-ahqaf","muhammad","al-fath","al-hujraat","qaaf","al-dhariyaat","at-tur","an-najm","al-qamar","al-rahman","al-waqia","al-hadid","al-mujadilah","al-hashr","al-mumtahina","as-saff","al-jumua","al-munafiqoon","at-taghabun","at-talaq","at-tahrim","al-mulk","al-qalam","al-haaqqa","al-maarij","nooh","al-jinn","al-muzzammil","al-muddathir","al-qiyama","al-insan","al-mursalat","an-naba","an-naziat","abasa","at-takwir","al-infitar","al-mutaffifin","al-inshiqaq","al-burooj","at-tariq","al-ala","al-ghashiya","al-fajr","al-balad","ash-shams","al-lail","ad-dhuha","al-inshirah","at-tin","al-alaq","al-qadr","al-bayyina","al-zalzala","al-adiyat","al-qaria","at-takathur","al-asr","al-humaza","al-fil","quraish","al-maun","al-kauther","al-kafiroon","an-nasr","al-masadd","al-ikhlas","al-falaq","an-nas"];
    }

    function juz_amma_suras(){
        return ["an-naba", "an-naziat", "abasa", "at-takwir", "al-infitar", "al-mutaffifin", "al-inshiqaq", "al-burooj", "at-tariq", "al-ala", "al-ghashiya", "al-fajr", "al-balad", "ash-shams", "al-lail", "ad-dhuha", "al-inshirah", "at-tin", "al-alaq", "al-qadr", "al-bayyina", "al-zalzala", "al-adiyat", "al-qaria", "at-takathur", "al-asr", "al-humaza", "al-fil", "quraish", "al-maun", "al-kauther", "al-kafiroon", "an-nasr", "al-masadd", "al-ikhlas", "al-falaq", "an-nas"];
    }


    function checkPrivalege()
    {
        $admin_id          = \Auth::user()->id;
        $admin_type        = \Auth::user()->admin_type;
        $aside_id          = system_id()['aside_id'];
        $aside_dropdown_id = system_id()['aside_dropdown_id'];


        if($admin_type=='president'){
            $privileges = \DB::table('admin_privileges')->first();
        }
        else{
            $cond = [
                        ['aside_menu_id', 'like', '%"'.$aside_id.'"%']
                    ];

            if(!empty($aside_dropdown_id))
            {
                $cond[] = ['aside_menu_dropdown_id', 'like', '%"'.$aside_dropdown_id.'"%'];
            }

            $cond['admin_id'] = $admin_id;
            $privileges       = \DB::table('admin_privileges')->where($cond)->first();
        }

        return $privileges;
    }



    function send_email($from,$to,$subject,$replay)
    {
        $message = "
            <html>
                <head>
                    <title>$subject</title>
                </head>
                <body>
                    $replay
                </body>
            </html>
        ";

        // Always set content-type when sending HTML email
        $headers = "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

        // More headers
        $headers .= 'From: <'.$from.'>' . "\r\n";
        // $headers .= 'Cc: myboss@example.com' . "\r\n";

       return mail($to,$subject,$message,$headers);
    }

    function admin_mail_list()
    {
        return ['support@demo.com'];
    }


    function extendDateOrTime($date, $extend) //$data = "+1 month"
    {
        $date  = strtotime($date);
        $final = date("Y-m-d", strtotime($extend, $date));
        return $final;
    }


    function total_star_for_reporting()
    {
        return 2;
    }
?>