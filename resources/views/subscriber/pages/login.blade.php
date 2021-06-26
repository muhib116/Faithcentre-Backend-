@extends('subscriber.master')
@section('headerTitle', 'Dashboard | '.config('app.name'))

@section('content')
    <h3>Login Now</h3>
    <form action="{{ route('subscriber.login_process') }}" method="post">
        @csrf
        <div class="form_group">
            <i class="icon ion-md-person"></i>
            <input type="email" name="email" value="{{ old('email') }}" id="email" class="form_control {{ $errors->has('email') ? ' is-invalid' : '' }}" placeholder="Email Address" required autofocus>
            @if ($errors->has('email'))
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $errors->first('email') }}</strong>
                </span>
            @endif
        </div>
        <div class="form_group">
            <i class="icon ion-ios-lock"></i>
            <input type="password" name="password" id="password" class="form_control {{ $errors->has('password') ? ' is-invalid' : '' }}" placeholder="Password" required>
            @if ($errors->has('password'))
                <span class="invalid-feedback" role="alert">
                    <strong>{{ $errors->first('password') }}</strong>
                </span>
            @endif
        </div>
        <div class="form_group">
            <input type="submit" value="Sign In">
        </div>
    </form>
@endsection
