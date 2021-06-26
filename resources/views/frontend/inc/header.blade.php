<!DOCTYPE html>
<html lang="en">
    <head>
        {{-- Required meta tags --}}
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        {{-- <meta name="robots" content="noindex, nofollow"> --}}

        <meta name="theme-color" content="#FFFFFF"/>
        
        {{-- this author() method created in My_helper.php --}}
        <meta name="author" content="{{ author() }}">

        {{-- meta dynamic information start --}}
        <meta name="keywords" content="{{ isset($meta_keyword) ? $meta_keyword : "" }}">
        <meta name="description" content="{{ isset($meta_description) ? strip_tags($meta_description) : "" }}">
        <title>{{ isset($meta_title) ? strip_tags($meta_title) : "" }}</title>
        {{-- meta dynamic information end --}}

        <link rel="icon" type="image/x-icon" href="{{ asset($favicon) }}">

        <meta name="csrf-token" content="{{ csrf_token() }}" />


        <!-- All CSS Here -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="{{asset('public/frontend/css/master.css')}}">





        {{-- /****
         /* this method for pushing css from other page.
         /* donot delete this, this indicate that where to push the css
         /*****/ --}}
        @stack('css')
        
        {{-- share config load start --}}
        @include("frontend.shareConfig.facebookMeta")
        {{-- share config load end --}}

        
        {{-- share config load start --}}
        @include("frontend.googleTools.google_analytics")
        {{-- share config load end --}}

    </head>
    
    <body>
        {{-- share config load start --}}
        @include("frontend.shareConfig.facebookJs")