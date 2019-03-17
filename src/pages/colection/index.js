$(document).ready(function () {
    console.log(1)
    var Banner = new Swiper('.dg-about-banner .swiper-container', {
        slidesPerView: 1,
		loop: true,
		navigation: {
			nextEl: '.dg-about-banner .swiper-next',
			prevEl: '.dg-about-banner .swiper-prev'
		},
    })
});