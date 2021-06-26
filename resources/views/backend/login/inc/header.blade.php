<!DOCTYPE html>
<html lang="en">
    <head>
        {{-- Required meta tags --}}
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        {{-- this author() method created in My_helper.php --}}
        <meta name="author" content="{{ author() }}">

        {{-- meta dynamic information start --}}
        <meta name="keywords" content="{{ isset($meta_keyword) ? $meta_keyword : '' }}">
        <meta name="description" content="{{ isset($meta_description) ? $meta_description : '' }}">
        {{-- meta dynamic information end --}}

        <link rel="icon" type="image/x-icon" href="{{ asset('public/favicon.jpg') }}">
        <title>@yield('headerTitle')</title>

        {{-- google font --}}
		<link href="https://fonts.googleapis.com/css?family=Nunito+Sans:300,400,600,700" rel="stylesheet">
        
        {{-- include style --}}        
        <link rel="stylesheet" href="{{ asset('public/backend/font-awesome/css/font-awesome.min.css') }}">
        <link rel="stylesheet" href="{{ asset('public/backend/man/css/man.css') }}">
        <link rel="stylesheet" href="{{ asset('public/backend/css/credential.css') }}">

        {{-- manjs js --}}
        <script src="{{ asset('public/backend/man/js/man.js') }}"></script>
        {{-- mankit js --}}
        <script src="{{ asset('public/backend/man/js/mankit.js') }}"></script>
        
        @stack('css')
    </head>
    <body>