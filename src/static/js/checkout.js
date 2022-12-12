
//Cart
//Remove
$('.checkout-cart').on('click', 'a[href="#remove"]', function () {
	var cartItemID = $(this).parents('.media').data('item');
	var productID = $(this).parents('.media').data('product');
	console.log(productID);
	$(this).parents('.media').fadeOut('300');
	var subTotal = $(this).parents('.controls').prev('.media-body').find('.subtotal-price').text();
	var total = $('.total span');
	total.html(Number(total.text() - subTotal).toFixed(2))
	console.log(total.text());
	fetch(`http://127.0.0.1:8000/api/cart-item/${cartItemID}`, {
		method: 'DELETE',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify({ 'id': cartItemID })
	}
	).then((response) => {
		console.log(response);
	});
	var basketProducts = JSON.parse(localStorage.getItem('basket'));

	console.log(basketProducts);
	var basket = [];
	basketProducts.forEach(product => {
		if (product.id != productID) {
			basket.push(product);
		}
	});
	localStorage.removeItem("basket");
	localStorage.setItem("basket", JSON.stringify(basket));
	var productDataCountInBasket = basket.length;
	var productCountInBasket = document.querySelector(".label");
	productCountInBasket.lastChild.textContent = ` ${productDataCountInBasket}\n    `;

});
//Remove

//Count
$('.checkout-cart').on('click', '.input-group button[data-action="plus"]', function () {
	var quantity = parseInt($(this).parents('.input-group').find('input').val()) + 1

	$(this).parents('.input-group').find('input').val(quantity);
	var cartItemID = $(this).parents('.media').data('item');
	var price = $(this).parents('.controls').prev('.media-body').find('.item-price').text();
	var subTotal = $(this).parents('.controls').prev('.media-body').find('.subtotal-price');
	subTotal.html(Number(price * quantity).toFixed(2))
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

		subTotal.html(Number(price * quantity).toFixed(2))
		var total = $('.total span');
		total.html(Number(parseFloat(total.text()) - parseFloat(price)).toFixed(2))
		patch_fecth(cartItemID, quantity);
	}

});


function patch_fecth(cartItemID, quantity) {
	fetch(`http://127.0.0.1:8000/api/cart-item/${cartItemID}`, {
		method: 'PATCH',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify({ 'quantity': quantity })
	}
	).then((response) => {
		console.log(response);

		// return fetch(`http://127.0.0.1:8000/api/product/${productID}`)
		// 	.then((response) => response.json())
		// 	.then(product => {
		// 		this.product = product;
		// 		console.log(product);
		// 		// basket = {f'{productID}': product }
		// 		var basketProducts = JSON.parse(localStorage.getItem('basket'));

		// 		console.log(basketProducts);
		// 		var basket =[];
		// 		basketProducts.forEach(product => {

		// 			if (product.id != productID){
		// 				basket.push(product);
		// 			}
		// 		  })
		// 		localStorage.removeItem("basket");
		// 		localStorage.setItem("basket", JSON.stringify(basket));
		// 		var productDataCountInBasket = basket.length;
		// 		var productCountInBasket = document.querySelector(".label");
		// 		productCountInBasket.lastChild.textContent = ` ${productDataCountInBasket}\n    `;
		// 	})
	});
}



// $('#checkout-form').on('submit', function(e){
// 	e.preventDefault();

// 	// console.log();
// 	const user_id = JSON.parse(document.getElementById('user_id').textContent);
// 	var csrf = $("input[name='csrfmiddlewaretoken']").val();
// 	var total = Number($('.total span').text()).toFixed(2);

// 	data = {
// 		"status": "on_processing",
// 		"phone": $("input[name='phone']").val(),
// 		"receiver": $("input[name='receiver']").val(),
// 		"total": parseFloat(total),
// 		"products_quantity": 1,
// 		"country": 'AZ',
// 		"city": $("input[name='city']").val(),
// 		"street": $("input[name='street']").val(),
// 		"building": parseInt($("input[name='building']").val()),
// 		"zip": parseInt($("input[name='zip']").val()),
// 		"payment": 2,
// 		"promo_code": $("input[name='promo_code']").val(),
// 		"complete": false,
// 	}

// 	console.log(data);
// 	// var url = 'http://127.0.0.1:8000/api/order/';
// 	var url = 'http://127.0.0.1:8000/users/checkout/'
// 	fetch(url,{
// 	method: 'POST',
// 	headers: {
// 		'Accept': 'application/json',
//         'Content-Type': 'application/json',
//         'X-Requested-With': 'XMLHttpRequest',
// 		'X-CSRFToken': csrf,
// 	},
// 	body: JSON.stringify(data)
// 	}).then((response) =>{
// 		console.log(response);

// 	});
//     console.log("submitted"); 
// });


$('#checkout-form').on('submit', function (e) {
	e.preventDefault();

	var csrf = $("input[name='csrfmiddlewaretoken']").val();
	var total = Number($('.total span').text()).toFixed(2);

	data = {
		"status": "on_processing",
		"phone": $("input[name='phone']").val(),
		"receiver": $("input[name='receiver']").val(),
		"total": parseFloat(total),
		"products_quantity": 1,
		"city": $("input[name='city']").val(),
		"street": $("input[name='street']").val(),
		"building": parseInt($("input[name='building']").val()),
		"zip": parseInt($("input[name='zip']").val()),
		"payment": 2,
		"promo_code": $("input[name='promo_code']").val(),
		"complete": false,
		"csrfmiddlewaretoken": csrf
	}

	console.log(data);
	// var url = 'http://127.0.0.1:8000/api/order/';
	var url = 'http://127.0.0.1:8000/users/checkout/'
	localStorage.removeItem("basket");
	productCountInBasket.lastChild.textContent = 0;
	$.ajax({
		type: "POST",
		url: url,
		data: data,
		dataType: 'json',
		success: function(response){
			if(response.status == 1){ 
               	window.location.assign(response.success)
            }
		}

	});
});