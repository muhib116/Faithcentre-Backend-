@extends('subscriber.master')
@section('headerTitle', 'Dashboard | '.config('app.name'))

@section('content')
    <h1>Welcome to subscriber's Dashboard</h1>
    <a class="cursor_pointer" 
        onclick="event.preventDefault();
        document.getElementById('logout_subscriber_form').submit();"
    >
        <span>Logout</span>
        <i class="fa fa-sign-out"></i>
    </a>
    <form id="logout_subscriber_form" action="{{ route('subscriber.logout') }}" method="POST" style="display: none;">
        @csrf
    </form>
@endsection