
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

function urlReturn(url){
	return window.location.assign(url)
}

function sumbitForm(){
	// e.preventDefault();

	var csrf = $("input[name='csrfmiddlewaretoken']").val();
	var total = Number($('.total span').text()).toFixed(2);

	data = {
		"status": "on_processing",
		"phone": $("input[name='phone']").val(),
		"receiver": $("input[name='receiver']").val(),
		"total": total,
		"products_quantity": 1,
		"city": $("input[name='city']").val(),
		"street": $("input[name='street']").val(),
		"building": parseInt($("input[name='building']").val()),
		"zip": parseInt($("input[name='zip']").val()),
		"csrfmiddlewaretoken": csrf
	}

	console.log(data);
	var url = 'http://127.0.0.1:8000/users/checkout/'
	
	$.ajax({
		type: "POST",
		url: url,
		data: data,
		dataType: 'json',
		success: function(response){
			if(response.status == 1){ 
               	window.location.assign(response.success);
				localStorage.removeItem("basket");
				productCountInBasket.lastChild.textContent = 0;
            }
			else{
				alert("Error: " + response.error);
				setTimeout(() => urlReturn(url), 500);
			}
		}

	});
};


function checkTotal(){
	var csrf = $("input[name='csrfmiddlewaretoken']").val();
	var total = Number($('.total span').text()).toFixed(2);

	data = {
		"total": total,
		"csrfmiddlewaretoken": csrf
	}

	console.log(data);
	var url = 'http://127.0.0.1:8000/users/checkout/'
	
	$.ajax({
		type: "POST",
		url: url,
		data: data,
		dataType: 'json',
		success: function(response){
			if(response.status == 0){
				alert("Error: " + response.error);
				setTimeout(() => urlReturn(url), 500);
			}
		}

	});
}


  const paypalButtonsComponent = paypal.Buttons({
    // optional styling for buttons
    // https://developer.paypal.com/docs/checkout/standard/customize/buttons-style-guide/
    style: {
      color: "black",
      shape: "rect",
      layout: "vertical",
      height: 40,
    },
	
    // set up the transaction
    createOrder: (data, actions) => {
		var total = Number($('.total span').text()).toFixed(2);
      // pass in any options from the v2 orders create call:
      // https://developer.paypal.com/api/orders/v2/#orders-create-request-body
      const createOrderPayload = {
        purchase_units: [
          {
            amount: {
              value: parseFloat(total).toFixed(2)
            }
          }
        ]
      };
	  checkTotal()
      return actions.order.create(createOrderPayload);
    },

    // finalize the transaction
    onApprove: (data, actions) => {
      const captureOrderHandler = (details) => {
        const payerName = details.payer.name.given_name;
		sumbitForm()
      };

      return actions.order.capture().then(captureOrderHandler);
    },

    // handle unrecoverable errors
    onError: (err) => {
      console.error('An error prevented the buyer from checking out with PayPal');
    }
  });

  paypalButtonsComponent
    .render("#paypal-button-container")
    .catch((err) => {
      console.error('PayPal Buttons failed to render');
    });
