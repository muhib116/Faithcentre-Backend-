{{-- main header and nav start --}}
@include('user_panel.inc.header')
@include('user_panel.inc.nav')
{{-- main header and nav end --}}



{{-- userpanel aside start --}}
@include('user_panel.inc.aside')
{{-- userpanel aside end --}}


{{-- main content loaded here start --}}
@section('content')
@show
{{-- main content loaded here end --}}

{{-- userpanel footer start --}}
@include('user_panel.inc.footer')
{{--  userpanel footer end  --}}
