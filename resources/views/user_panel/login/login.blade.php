@include('frontend.inc.header')
<!-- Login Wrapper -->
<div class="card custom-card">
    {!! msg($name='msg') !!}
    @if ($errors->any())
    {{ validation_msg($errors->all()) }}
    @endif
    
    
    <form method="post" action="{{ route('user.login_process') }}" class="box">
        @csrf

        <h1>Login</h1>
        <p class="text-muted"> Please enter your login and password!</p>

        <input type="email" name="email" value="{{ old('email') }}" id="email" class="{{ $errors->has('email') ? ' is-invalid' : '' }}" placeholder="Email ..." required autofocus>
        @if ($errors->has('email'))
            <div class="alert alert_danger">
                {{ $errors->first('email') }}
            </div>
        @endif

        <input type="password" name="password" id="password" class="{{ $errors->has('password') ? ' is-invalid' : '' }}" placeholder="Password..." required>
        @if ($errors->has('password'))
            <div class="alert alert_danger">
                {{ $errors->first('password') }}
            </div>
        @endif

        {{-- <a class="forgot text-muted" href="#">Forgot password?</a> --}}
        <input type="submit" value="Login" >
    </form>
</div>
<!-- End Login Wrapper -->

















    {{-- <div class="login_main_wrapper">
        <div class="container">
            <div class="left">
                <div>
                    <div class="slogan">
                        Get Fastest Experience
                    </div>
                    <div class="logo">
                        <img src="https://lh3.googleusercontent.com/proxy/cBa9Nsi3aR33poxYh9QasM3CIXxbAQZXyKrXOtTA3e73dUzm6PAsVoIoPC8FgPQ7KJCAMs06_5TYQhGtnhFT_oqgS_sXzwaUJMZWjcRCc9SEC3IOUEo" alt="">
                    </div>
                </div>
            </div>
            <div class="right">
                <div class="login_form">
                    <h1 class="form_title">User Login</h1>
                    <form  action="{{ route('user.login_process') }}" method="post">
                        @csrf
                        <div class="form_row">
                            <label for="phone">Username</label>
                            <input type="username" name="username" value="{{ old('username') }}" id="username" class="form_control {{ $errors->has('username') ? ' is-invalid' : '' }}" placeholder="Username ..." required autofocus>
                            @if ($errors->has('username'))
                                <div class="alert alert_danger">
                                    {{ $errors->first('username') }}
                                </div>
                            @endif
                        </div>
                        <div class="form_row">
                            <label for="password">Password</label>
                            <input type="password" name="password" id="password" class="form_control {{ $errors->has('password') ? ' is-invalid' : '' }}" placeholder="Password..." required>
                            @if ($errors->has('password'))
                                <div class="alert alert_danger">
                                    {{ $errors->first('password') }}
                                </div>
                            @endif
                        </div>
                        <div class="form_row">
                            <button type="submit" class="login_btn">Login</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div> --}}



<style>
    .card{
        border-radius: 0;
    }
    .header-section,
    footer{
        display: none;
    }
</style>