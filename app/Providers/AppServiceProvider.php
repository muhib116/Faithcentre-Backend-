<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use View;
use DB;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot(){
        Schema::defaultStringLength(200);

        $theme_settings = DB::table('system_theme_settings')->get();
        if(count($theme_settings)>0){
            foreach ($theme_settings as $key => $value){
                View::share($value->theme_key, $value->theme_value);
            }
        }
    }
}
