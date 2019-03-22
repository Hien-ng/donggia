$(document).ready(function () {
	// add box-shadow for header
	if ($(window).scrollTop() > 0) {
		$('header').addClass('fixed')
	} else {
		$('header').removeClass('fixed')
	}
	$(window).on('scroll', function () {
		if ($(window).scrollTop() > 0) {
			$('header').addClass('fixed')
		} else {
			$('header').removeClass('fixed')
		}
	})

	// Header Language
	$('header .language .current').on('click', function () {
		$('header .language .dropdown').toggleClass('active')
		$(this).toggleClass('active')
	})

	// Header search
	$('header .search .search-toggle').on('click', function () {
		$('body').removeClass('hiddenX')
		$('header .search .searchbox').slideToggle()
		$('header .backdrop').hide()
		$('header .category-list').removeClass('active')
		$('header .sub-menu').removeClass('active')
		$('header .language .dropdown').removeClass('active')
		$('header .language .current').removeClass('active')
	})

	// Header menu mobile
	$('header .toggle-menu').on('click', function () {
		$('header .search .searchbox').hide()
		$('header .language .dropdown').removeClass('active')
		$('header .language .current').removeClass('active')
		$('header .backdrop').fadeToggle()
		$('header .category-list').toggleClass('active')
		$('header .sub-menu').toggleClass('active')
		$('body').toggleClass('hiddenX')
	})

	// Remove menu toggle effect
	$('header .backdrop').on('click', function () {
		$('body').removeClass('hiddenX')
		$('header .search .searchbox').hide()
		$('header .language .dropdown').removeClass('active')
		$('header .language .current').removeClass('active')
		$('header .backdrop').hide()
		$('header .category-list').removeClass('active')
		$('header .sub-menu').removeClass('active')
	})
	$(window).on('resize', function () {
		$('body').removeClass('hiddenX')
		$('header .search .searchbox').hide()
		$('header .language .dropdown').removeClass('active')
		$('header .language .current').removeClass('active')
		$('header .backdrop').hide()
		$('header .category-list').removeClass('active')
		$('header .sub-menu').removeClass('active')
	})
})