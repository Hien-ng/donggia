
$(document).ready(function () {
    $('#gotop').on('click', function () {
		$('html,body').animate({
			scrollTop: 0
		}, 1000)
	})
});
// var swiper = new Swiper('.dg-banner .swiper-container')