
        </div>
        {{-- main right start --}}
    </div>
    
    
    {{-- jquery start --}}
    <script
        src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
    {{-- jquery end --}}
		
    {{-- bootstrap js start --}}
    <script src="{{ asset('public/backend/third_perty/bootstrap/js/bootstrap.min.js') }}"></script>
    {{--  bootstrap js end --}}


	{{-- include js --}}
	<script src="{{ asset('public/backend/js/app.js') }}?v=0.0.1"></script>

	
    {{--/****
	/* this method for pushing js from other page.
	/* donot delete this, this indicate that where to push the js
	/*****/ --}}
	@stack('js')
</body>
</html>
