<?php

namespace App\Http\Controllers\Admin\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;


// my written code start
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
// my written code end

use App\Models\Admin\Admin;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/backend/dashboard';//route name

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest:admin_logins')->except('logout');
    }


    // my written code start
    public function showLoginForm() {
        return view('backend.login.pages.login');
    }

    public function login(Request $request) {
        $this->validateLogin($request);

        if ($this->attemptLogin($request)) {
            return $this->sendLoginResponse($request);
        }

        return $this->sendFailedLoginResponse($request);
    }

    protected function sendLoginResponse(Request $request) {
        $request->session()->regenerate();
        
        return $this->authenticated($request, $this->guard()->user()) ?: redirect()->intended($this->redirectPath());
    }

    public function logout(Request $request) {
        Auth::guard('admin_logins')->logout();

        // if successful, then redirect to intended location
        return redirect()->intended(route('admin.login'));
    }

    protected function credentials(Request $request) {
        $admin = Admin::where('email', $request->email)->first();

        if($admin !== null) {
            if($admin->status == 0) {
                return ['email' => 'inactive', 'password' => 'You are not an active persone, please contact to admin.'];
            } else {
                return ['email' => $request->email, 'password' => $request->password, 'status' => 1];
            }
        }

        return $request->only($this->username(), 'password');
    }

    protected function sendFailedLoginResponse(Request $request) {
        $fields = $this->credentials($request);

        if($fields['email'] == 'inactive') {
            $errors = [$this->username() => $fields['password']];
        } else {
            $errors = [$this->username() => trans('auth.failed')];
        }

        // dd($errors);

        if($request->expectsJson()) {
            return response()->json($errors, 422);
        }

        return redirect()->back()->withInput($request->only($this->username(), 'remember'))->withErrors($errors);
    }
    
    public function username()
    {
        return 'email';
    }

    protected function guard() {
        return Auth::guard('admin_logins');
    }
    // my written code end

}
