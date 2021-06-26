<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class RedirectIfAuthenticated
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null){
        if (Auth::guard($guard)->check()) {

            switch ($guard) {   
                case 'admin_logins':
                    return redirect('/backend/dashboard');
                    break;
                
                case 'subscriber_logins':
                    return redirect('/subscriber/dashboard');
                    break;

                default:
                    return redirect('/user/dashboard');
                    break;
            }
        }

        return $next($request);
    }
}
