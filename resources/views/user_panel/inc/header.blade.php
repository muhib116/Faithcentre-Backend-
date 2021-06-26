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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha512-SfTiTlX6kk+qitfevl/7LibUOeJWlt9rbyDn92a1DqWOw9vWG2MFoays0sgObmWazO5BQPiFucnnEAjpAB+/Sw==" crossorigin="anonymous">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


        <link rel="stylesheet" href="{{ asset('public/userpanel/css/style.css') }}">


        {{-- /****
        /* this method for pushing css from other page.
        /* donot delete this, this indicate that where to push the css
        /*****/ --}}
        @stack('css')
    </head>
    <body>
