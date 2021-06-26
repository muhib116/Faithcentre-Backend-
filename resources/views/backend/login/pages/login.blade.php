@extends('backend.login.master')
@section('headerTitle', 'Admin Login | '.((isset($site_name)) ? $site_name : ''))

@section('content')


    <div class="login_main_wrapper">
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
                    <h1 class="form_title">Admin Login</h1>
                    <form  action="{{ route('admin.login_process') }}" method="post">
                        @csrf
                        <div class="form_row">
                            <label for="email">Email</label>
                            <input type="email" name="email" value="{{ old('email') }}" id="email" class="form_control {{ $errors->has('email') ? ' is-invalid' : '' }}" placeholder="Email Address..." required autofocus>
                            @if ($errors->has('email'))
                                <div class="alert alert_danger">
                                    {{ $errors->first('email') }}
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
    </div>
@endsection


@push('css')
    <link rel="stylesheet" href="{{ asset('public/backend/css/login.css') }}">
@endpush