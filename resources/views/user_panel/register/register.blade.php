@include('frontend.inc.header')
    @include('backend.inc.preloader')
    @include('frontend.inc.nav')
    
    {!! msg($name='msg') !!}
    @if ($errors->any())
    {{ validation_msg($errors->all()) }}
    @endif

    <!-- Register Wrapper -->
    <div class="card custom-card">
        <form class="box" method="post" action="{{ route("user.register") }}" id="regitration_form">
            @csrf
            <h1>Register</h1>
            <p class="text-muted"> Please enter your original information</p>
            <input type="text" name="sponsore_id" id="sponsore_id" value="{{ isset($_GET['sponsore_id']) ? $_GET['sponsore_id'] : '' }}" placeholder="Sponsore ID..." required>
            <span id="sponsore_msg"></span>

            <input type="text" name="name" value="{{ old('name') }}" placeholder="Full Name..." required>
            <input type="email" name="email" value="{{ old('email') }}" placeholder="Email Address..." required>
            <input type="text" name="phone" value="{{ old('phone') }}" placeholder="Phone Number..." required>
            
            <input type="password" name="password" id="password" placeholder="Password..." required>
            <span id="pass_msg"></span>
            <input type="password" name="confirm_password" id="confirm_password" placeholder="Confirm Password..." required>
            

            @php
                $trx_pin = time();
            @endphp
            <input type="hidden" name="transection_id" value="{{ $trx_pin }}" id="transection_id" value="{{ old('transection_id') }}" placeholder="Transection ID..." required>
            <span id="transection_msg"></span>
            <input type="hidden" name="confirm_transection_id" value="{{ $trx_pin }}" id="confirm_transection_id" value="{{ old('confirm_transection_id') }}" placeholder="Confrirm Transection ID..." required>


            Already Have an Account ?  <a class="forgot text-muted" href="{{ route('user.login') }}">Login Here</a>
            <input type="submit" value="Register">
        </form>
    </div>
    <!-- End Register Wrapper -->

@include('frontend.inc.footer')

<script>
    /*check sponsore id matched or not start------------*/
        let sponsore_id  = document.getElementById('sponsore_id'),
            sponsore_msg = document.getElementById('sponsore_msg');

        if(sponsore_id && sponsore_msg)
        {
            let debouncing_status = true;
            sponsore_id.addEventListener('input', function()
            {
                if(debouncing_status){
                    clearTimeout(debouncing_status);
                }

                debouncing_status = setTimeout(()=>
                {
                    fetch(`{{ asset('matched_sponsored_id_by_ajax') }}?key=${this.value}`)
                    .then(response => response.json())
                    .then(data => {
                        if(data)
                        {
                            sponsore_msg.style.cssText = '';
                            sponsore_msg.innerHTML     = ''; 
                            window.sponsore_id_status = true;
                        }else{
                            sponsore_msg.style.cssText = 'color: #ffa726;font-size:12px;display:inline-block;padding:0 15px;';
                            sponsore_msg.innerHTML     = 'Sponsore ID Not Matched.';     
                            window.sponsore_id_status = false;
                        }
                    });
                }, 800);

            });
        }
    /*check sponsore id matched or not end--------------*/


    /*check password and confirm_password Matched, and also transection_id and confirm_transection_id Matched start*/
        let password               = document.getElementById('password'),
            confirm_password       = document.getElementById('confirm_password'),
            pass_msg               = document.getElementById('pass_msg'),
            transection_id         = document.getElementById('transection_id'),
            confirm_transection_id = document.getElementById('confirm_transection_id'),
            transection_msg        = document.getElementById('transection_msg'),
            regitration_form       = document.getElementById('regitration_form');


        if(password && confirm_password && transection_id && confirm_transection_id && pass_msg && transection_msg)
        {
            confirm_password.addEventListener('input', function(){
                if(password.value !== confirm_password.value)
                {
                    pass_msg.style.cssText = 'color: #ffa726;font-size:12px;display:inline-block;padding:0 15px;';
                    pass_msg.innerHTML = 'Password and Confirm Password Not Matched.';
                }else{
                    pass_msg.style.cssText = 'color: ""';
                    pass_msg.innerHTML     = '';
                }
            });


            confirm_transection_id.addEventListener('input', function(){
                if(transection_id.value !== confirm_transection_id.value)
                {
                    transection_msg.style.cssText = 'color: #ffa726;font-size:12px;display:inline-block;padding:0 15px;';
                    transection_msg.innerHTML = 'Transection ID and Confirm Transection ID Not Matched.';
                }else{
                    transection_msg.style.cssText = 'color: "";font-size:12px;';
                    transection_msg.innerHTML     = '';
                }
            });
            

            if(regitration_form)
            {
                regitration_form.addEventListener('submit', function(event)
                {
                    if(!sponsore_id_status)
                    {
                        event.preventDefault();
                        alert('Sponsore ID Not Matched!');
                    }


                    if(password.value !== confirm_password.value)
                    {
                        pass_msg.style.cssText = 'color: #ffa726;font-size:12px;display:inline-block;padding:0 15px;';
                        pass_msg.innerHTML = 'Password and Confirm Password Not Matched.';
                        event.preventDefault();
                        alert('Password and Confirm Password Not Matched!');
                    }

                    if(transection_id.value !== confirm_transection_id.value)
                    {
                        transection_msg.style.cssText = 'color: #ffa726;font-size:12px;display:inline-block;padding:0 15px;';
                        transection_msg.innerHTML = 'Transection ID and Confirm Transection ID Not Matched.';
                        event.preventDefault();
                        alert('Transection ID and Confirm Transection ID Not Matched!');
                    }
                });
            }
        }
    /*check password and confirm_password Matched, and also transection_id and confirm_transection_id Matched end*/
</script>