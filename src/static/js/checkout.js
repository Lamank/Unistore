
	//Cart
	//Remove
	$('.checkout-cart').on('click', 'a[href="#remove"]', function () {
		var cartItemID = $(this).parents('.media').data('item');
		console.log(cartItemID);
		$(this).parents('.media').fadeOut('300');
		var subTotal = $(this).parents('.controls').prev('.media-body').find('.subtotal-price').text();
		var total = $('.total span');
		total.html(Number(total.text()-subTotal).toFixed(2))
		console.log(total.text());
		fetch(`http://127.0.0.1:8000/api/cart-item/${cartItemID}`,{
			method: 'DELETE',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({'id': cartItemID})
		}
		).then((response) => {
			console.log(response);
		});
	});
	//Remove

	//Count
	$('.checkout-cart').on('click', '.input-group button[data-action="plus"]', function () {
		var quantity = parseInt($(this).parents('.input-group').find('input').val()) + 1

		$(this).parents('.input-group').find('input').val(quantity);
		var cartItemID = $(this).parents('.media').data('item');
		var price = $(this).parents('.controls').prev('.media-body').find('.item-price').text();
		var subTotal = $(this).parents('.controls').prev('.media-body').find('.subtotal-price');
		subTotal.html(Number(price*quantity).toFixed(2))
		var total = $('.total span');
		total.html(Number(parseFloat(total.text()) + parseFloat(price)).toFixed(2))
		
		patch_fecth(cartItemID, quantity);
	});
	
		
	$('.checkout-cart').on('click', '.input-group button[data-action="minus"]', function () {
		if (parseInt($(this).parents('.input-group').find('input').val()) > 1) {
		
			var quantity = parseInt($(this).parents('.input-group').find('input').val()) - 1
			$(this).parents('.input-group').find('input').val(quantity);
			var cartItemID = $(this).parents('.input-group').parents('.controls').parents('.media').data('item');
			var price = $(this).parents('.input-group').parents('.controls').prev('.media-body').find('.item-price').text();
			var subTotal = $(this).parents('.input-group').parents('.controls').prev('.media-body').find('.subtotal-price');
		
			subTotal.html(Number(price*quantity).toFixed(2))
			var total = $('.total span');
			total.html(Number(parseFloat(total.text()) - parseFloat(price)).toFixed(2))
			console.log(total.text());
			patch_fecth(cartItemID, quantity);
			
			}

		});
	

function patch_fecth(cartItemID, quantity){
	fetch(`http://127.0.0.1:8000/api/cart-item/${cartItemID}`,{
		method: 'PATCH',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify({'quantity': quantity})
	}
	).then((response) =>{
		console.log(response);
	});
}