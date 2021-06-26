<!DOCTYPE html>
<html lang="en">
    <head>
        {{-- Required meta tags --}}
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <meta name="robots" content="noindex">

        <meta name="csrf-token" content="{{ csrf_token() }}" />

        {{-- meta dynamic information start --}}
        <meta name="keywords" content="{{ isset($meta_keyword) ? $meta_keyword : '' }}">
        <meta name="description" content="{{ isset($meta_description) ? $meta_description : '' }}">
        {{-- meta dynamic information end --}}

        <link rel="icon" type="image/x-icon" href="{{ isset($favicon) ? asset($favicon) : '' }}">
        <title>@yield('headerTitle')</title>

        {{-- include style --}}
        <link rel="stylesheet" href="{{ asset('public/backend/third_perty/font-awesome/css/font-awesome.min.css') }}">


        {{-- bootstrap css start --}}
        <link rel="stylesheet" href="{{ asset('public/backend/third_perty/bootstrap/css/bootstrap.min.css') }}">
        {{--  bootstrap css end --}}

        <link rel="stylesheet" href="{{ asset('public/backend/css/master.css') }}">


        {{-- /****
        /* this method for pushing css from other page.
        /* donot delete this, this indicate that where to push the css
        /*****/ --}}
        @stack('css')

        <style>
            @media print{
                .main_container .right_side{
                    min-width: 100%;
                    max-width: 100%;
                }
                .print_hide{
                    display: none !important;
                }
            }
            ::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
                color: #ccc !important;
                opacity: 0.9; /* Firefox */
            }
        </style>

    </head>
    <body class="mode {{ isset($soft_mode) ? $soft_mode : '' }}">
        <div class="main_container">
        {{-- left_side start --}}
