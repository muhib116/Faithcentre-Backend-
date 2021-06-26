<div id="onnorokom_preloader" style="position: fixed;left: 0;top: 0;right: 0;bottom: 0;z-index: 9999;background: #fff;display: flex;align-items: center;justify-content: center;">
	<img style="max-width: 400px;width: 100%;" src="{{ asset('public/backend/img/preloader.gif') }}" alt="Preloader">
</div>

<script>
	window.addEventListener('load', function(){
		onnorokom_preloader.style.cssText = "display:none !important;";
		onnorokom_preloader.style.display = "none";
	});
</script>
