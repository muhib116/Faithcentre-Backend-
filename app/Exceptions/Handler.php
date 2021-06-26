<?php

namespace App\Exceptions;

use Exception;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;

// my written code start
use Illuminate\Auth\AuthenticationException;
// my written code end

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array
     */
    protected $dontFlash = [
        'password',
        'password_confirmation',
    ];

    /**
     * Report or log an exception.
     *
     * @param  \Exception  $exception
     * @return void
     */
    public function report(Exception $exception)
    {
        parent::report($exception);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Exception  $exception
     * @return \Illuminate\Http\Response
     */
    public function render($request, Exception $exception)
    {
        return parent::render($request, $exception);
    }


    // my written code start
    protected function unauthenticated($request, AuthenticationException $exception) {
        $guard = array_get($exception->guards(), 0);

        if($request->expectsJson()) {
            return response()->json(['message' => $exception->getMessage()], 401);
        } else {
            $guard = array_get($exception->guards(), 0);

            switch ($guard) {
                case 'admin_logins':
                    return redirect()->guest(route('admin.login'));
                    break;

                    case 'subscriber_logins':
                        return redirect()->guest(route('subscriber.login'));
                        break;
                
                default:
                    return redirect()->guest(route('user.login'));
                    break;
            }
        }
        
    }
    // my written code end
}
