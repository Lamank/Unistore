$(document).ready(function(){
	//Filter
		$('.filter .item > .controls').on('click', '.checkbox-group', function(){
			if( $(this).attr('data-status') =='inactive' ){
				$(this).find('input').prop('checked', true);
				$(this).attr('data-status','active'); }
			else{
				$(this).find('input').prop('checked', false);
				$(this).attr('data-status','inactive'); }
		});


		$('.filter .item a[data-action="clear"]').on('click', function(){
			$(this).parents('.item').find('input').prop('checked', false);
			$(this).parents('.item').find('.checkbox-group').attr('data-status', 'inactive');
		});
		

		$('.filter .item a[data-action="open"]').on('click', function(){
			if( $(this).attr('class') == 'down' ){
				$(this).removeClass('down').addClass('up');
				$(this).parents('.item').find('.title > a[data-action="clear-price"]').fadeIn('slow'); 
				$(this).parents('.item').find('.title > a[data-action="clear"]').fadeIn('slow'); 
				$(this).parents('.item').find('.controls').fadeIn('slow'); }
			else {
				$(this).removeClass('up').addClass('down');
				$(this).parents('.item').find('.title > a[data-action="clear-price"]').fadeOut('slow'); 
				$(this).parents('.item').find('.title > a[data-action="clear"]').fadeOut('slow'); 
				$(this).parents('.item').find('.controls').fadeOut('slow'); }
		});

		
	//Filter

	//Favorites
		$('.products .product').on('click', 'a.favorites', function(){
			if( $(this).attr('data-favorite') == 'inactive' ){
				$(this).attr('data-favorite', 'active');
			}
			else{
				$(this).attr('data-favorite', 'inactive');
			}
		});
	//Favorites

	//Sorting
		$('.tags').on('click', 'button.dropdown-toggle', function(){
			if( $(this).find('i').attr('class') == 'ion-arrow-down-b rotate' ){
				$(this).find('i').removeClass('rotate'); }
			else{ $(this).find('i').addClass('rotate'); }

		});

		$('.tags').on('focusout', 'button.dropdown-toggle', function(){
			$(this).find('i').removeClass('rotate');
		});

		$('.tags').on('click', 'li', function(){
			if( !$(this).hasClass('active')){
				$('.tags li').removeClass('active');
				$(this).addClass('active');
			}
			else{
				$(this).removeClass('active');;
			}
		});
	//Sorting

	//Cart
		//Toggle
			setTimeout(function(){ $('body').find('.cart').fadeIn('slow'); }, 1000);

			$('a[href="#open-cart"]').on('click', function(){
				$('body').attr('data-view', 'modal-open');
				$('body').find('.cart').attr('data-toggle', 'active');
			});
			

			$('.cart').on('click', '.label', function(){
				$('body').attr('data-view', 'modal-open');
				$(this).parents('.cart').attr('data-toggle', 'active');
				//$('body').find('.cart').fadeIn('slow');
			});
			
			$('.cart').on('click', 'button.close, .overlay', function(){
				$('body').attr('data-view', '');
				$(this).parents('.cart').attr('data-toggle', 'inactive');
				//$('body').find('.cart').fadeOut('slow');
			});
		//Toggle

		//Remove
			$('.cart').on('click', 'a[href="#remove"]', function(){
				$(this).parents('.media').fadeOut('300');
			});
		//Remove

		//Count
			$('.cart').on('click', '.input-group button[data-action="plus"]', function(){
				$(this).parents('.input-group').find('input').val( parseInt($(this).parents('.input-group').find('input').val()) + 1 );
			});
			$('.cart').on('click', '.input-group button[data-action="minus"]', function(){
				if( parseInt($(this).parents('.input-group').find('input').val()) > 1 ) {
					$(this).parents('.input-group').find('input').val( parseInt($(this).parents('.input-group').find('input').val()) - 1 );
				}
			});
		//Count

		//Scroll
			$(".cart .content").mCustomScrollbar({
			    theme:"dark",
			    scrollButtons: false,
			    contentTouchScroll: true
			});
		//Scroll
	//Cart

	// Reviews
		//Scroll
			$(".comments .wrapper .content").mCustomScrollbar({
			    theme:"dark",
			    scrollButtons: false,
			    contentTouchScroll: true
			});
		//Scroll
	// Reviews
});