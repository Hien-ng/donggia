$(document).ready(function(){
	// Product toggle menu
	$('.product-category .nav-item').on('click', function () {
		$(this).toggleClass('active')
		$(this).find('.dropdown').fadeToggle()
		$('.product-category .nav-item').not(this).removeClass('active')
		$('.product-category .nav-item').not(this).find('.dropdown').hide()
	})
});