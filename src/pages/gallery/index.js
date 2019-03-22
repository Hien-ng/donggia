$(document).ready(function(){
	var productOther = new Swiper('.product-wrapper .product-other .swiper-container', {
		slidesPerView: 3,
		loop: true,
		speed: 1000,
		spaceBetween: 20,
		autoplay: {
			delay: 3000,
			disableOnInteraction: false,
		},
		breakpoints: {
			768: {
				slidesPerView: 2,
			}
		}
	})
	var $isoGrid = $('.gallery .grid').isotope({
		itemSelector: '.grid-item',
		percentPosition: true,
		masonry: {
			columnWidth: '.grid-sizer',
			gutter: 0,
		}
	})
	$(window).on('resize', function () {
		$('.gallery .grid').isotope('shuffle')
	})

	$('.gallery .viewmore a').on('click', function (e) {
		e.preventDefault()
		var url = $(this).attr('href')
		$.ajax({
			url: url,
			data: { isAjax: true },
			success: function (data) {
				let newHtml = $($(data).find('.grid').html()).filter('.grid-item')
				$isoGrid.isotope('insert', newHtml)
				let newUrl = $($(data).find('.viewmore').html()).attr('href')
				$('.gallery .viewmore a').attr('href', newUrl)
			},
		})
	})
});