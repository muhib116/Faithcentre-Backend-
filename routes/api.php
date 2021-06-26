<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


/*faq content route start*/
Route::get('/faq', function(){
	$result = \DB::table('faqs')
					->where(["status"=>1])
					->select(
						'name as title',
						'detail as value',
						'slug'
					)
					->get();

	if(count($result))
	{
		return $result->toJson();
	}else{
		return json_encode([]);
	}
});
/*faq content route end*/


/*video content route start*/
Route::get('/video', function(){
	$result = \DB::table('videos')
					->select(
						'video_code',
						'details as caption'
					)
					->get();

	if(count($result))
	{
		return $result->toJson();
	}else{
		return json_encode([]);
	}
});
/*video content route end*/


/*route for home page start*/
Route::group(['namespace' => 'API'], function()
{
	Route::get('get_section_data/{section_name?}', 'homeController@get_section');
	Route::get('get_customer_feedback_data', 'homeController@get_customer_feedback_data');
	Route::get('get_cours_data', 'homeController@get_cours_data');
});
/*route for home page end*/




/*media content route start*/
/*Route::get('/media', function(){
	$result = \DB::table('media')
					->select(
						'file_name',
						'caption',
						'alt_text'
					)
					->get()->toJson();

	return $result;
});*/
/*media content route end*/




/*our team content route start*/
Route::get('/our-team', function()
{
	$result = \DB::table('our_teams')->where(['status'=>1])->get();

	if(count($result))
    {
        foreach ($result as $key => $value)
        {
            $value->detail   = make_short(strip_tags($value->detail), 200);
            $value->img_path = asset("public/backend/images/team");
        }

        return  $result->toJson();
    }else{
        return json_encode([]);
    }
});
/*our team content route end*/



/*gallery content route start*/
Route::get('/gallery', function()
{
	$result = \DB::table('galleries')->where(['status'=>1])->get();

	if(count($result))
    {
        foreach ($result as $key => $value)
        {
            $value->img_path = asset("public/backend/images/gallery");
        }

        return  $result->toJson();
    }else{
        return json_encode([]);
    }
});
/*gallery content route end*/



/*site_info content route start*/
Route::get('/site_info', function()
{
	$result = \DB::table('system_theme_settings')->where(['status'=>1])->get();

	$site_info = [];
	if(count($result))
    {
    	foreach ($result as $key => $value)
        {
            $site_info[$value->theme_key] = $value->theme_value;
        }

        return  json_encode($site_info);
    }else{
        return json_encode([]);
    }
});
/*site_info content route end*/





/*section single page start*/
Route::get('/page/{section_slug}', function($section_slug)
{
	$cond = [
		"status" => 1,
		"slug"   => $section_slug
	];
	

    $result = \DB::table('pages')
                ->where($cond)
                ->get();


    if(count($result))
    {
        return  $result->toJson();
    }else{
        return json_encode([]);
    }
});
/*section single page end*/



/*sours single page start*/
Route::get('/cours/{slug}', function($slug)
{
	$cond = [
		"status" => 1,
		"slug"   => $slug
	];
	

    $result = \DB::table('our_courses')
                ->where($cond)
                ->get();


    if(count($result))
    {
    	foreach ($result as $key => $value)
        {
            $value->img_path = asset("public/backend/images/cours");
        }

        return  $result->toJson();
    }else{
        return json_encode([]);
    }
});
/*sours single page end*/



/*contact form process start*/
Route::post('/contact', function(Request $request)
{
	$data = [
		'date' 	  => date("Y-m-d"),
		'time' 	  => date("H:i:s"),
		"name" 	  => $request->first_name.' '.$request->last_name,
		"subject" => $request->subject,
		"email"   => $request->email,
		"details" => strip_tags($request->message)
	];

	if(\DB::table('contact_us')->insert($data))
	{
		return 1;
	}else{
		return 0;
	}
});
/*contact form process end*/
