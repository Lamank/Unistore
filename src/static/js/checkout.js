
	//Cart
	//Remove
	$('.checkout-cart').on('click', 'a[href="#remove"]', function () {
		let prodPrice =parseFloat($(this).parents('.media').find('.price span').text());
		total -= parseFloat(prodPrice);

		total_price.html(Number(total).toFixed(2));
		$(this).parents('.media').fadeOut('300');
	});
	//Remove
	var title = ""
	var total = 0
	var total_price = $(".total span")
	//Count
	$('.checkout-cart').on('click', '.input-group button[data-action="plus"]', function () {
		$(this).parents('.input-group').find('input').val(parseInt($(this).parents('.input-group').find('input').val()) + 1);
		let price = $(this).parents('.input-group').parents(".controls").prev(".media-body").find('.price span');
		title = $(this).parents('.input-group').parents(".controls").prev(".media-body").find('h2').text().toLowerCase();

		fetch(`http://127.0.0.1:8000/api/cart-item/`)
			.then((response) => {
				return response.json();
			})
			.then((data) => {

				for (let i = 0; i < data.length; i++) {
					
					if (data[i]["product"].title.toLowerCase() == title) {
						var originalPrice = data[i]["product"].price;
				
						if (data[i]["product"]["campaign"] && data[i]["product"]["campaign"]["percent"]) {

							originalPrice = Number(data[i]["product"].price * (100 - (data[i]["product"]["campaign"]["percent"])) / 100).toFixed(2);
						
							
						}
						let prodPrice = parseFloat(price.text());
						
						prodPrice += parseFloat(originalPrice);
						console.log("total",total);
						total += parseFloat(originalPrice);
						console.log(total);
						price.html(Number(prodPrice).toFixed(2));
						total_price.html(Number(total).toFixed(2));
				}
			}
				
			});
			
			

	});
	$('.checkout-cart').on('click', '.input-group button[data-action="minus"]', function () {
		if (parseInt($(this).parents('.input-group').find('input').val()) > 1) {
			$(this).parents('.input-group').find('input').val(parseInt($(this).parents('.input-group').find('input').val()) - 1);
			let price = $(this).parents('.input-group').parents(".controls").prev(".media-body").find('.price span');
			title = $(this).parents('.input-group').parents(".controls").prev(".media-body").find('h2').text().toLowerCase();
			fetch(`http://127.0.0.1:8000/api/cart-item/`)
				.then((response) => {
					return response.json();
				})
				.then((data) => {

					for (let i = 0; i < data.length; i++) {
						
						if (data[i]["product"].title.toLowerCase() == title) {
							var originalPrice = data[i]["product"].price;
					
							if (data[i]["product"]["campaign"] && data[i]["product"]["campaign"]["percent"]) {

								originalPrice = Number(data[i]["product"].price * (100 - (data[i]["product"]["campaign"]["percent"])) / 100).toFixed(2);
								
							}
							let prodPrice = parseFloat(price.text());
							
							prodPrice -= parseFloat(originalPrice);
							console.log("plus",prodPrice);
							total -= parseFloat(originalPrice);
							price.html(Number(prodPrice).toFixed(2))
							total_price.html(Number(total).toFixed(2))
					}
				}
				
			});
			}
		// console.log(total);
		});

// var prices = document.querySelectorAll(".price span");
var prices = $(".price span");
// console.log(prices);
// for (price in prices) {
// 	console.log(price); 
	
// // }

fetch(`http://127.0.0.1:8000/api/cart-item/`)
			.then((response) => {
				return response.json();
			})
			.then((data) => {

				for (let i = 0; i < data.length; i++) {
						var originalPrice = data[i]["product"].price;
				
						if (data[i]["product"]["campaign"] && data[i]["product"]["campaign"]["percent"]) {

							originalPrice = Number(data[i]["product"].price * (100 - (data[i]["product"]["campaign"]["percent"])) / 100).toFixed(2);
			
					}
					total += parseFloat(originalPrice);
					
				}
				// total_price.html(Number(total).toFixed(2))
			
				
			})
			.then(responseJSON =>{
				total += parseFloat(originalPrice);
				$(document).on('submit', '#confirm', function(e) {
					e.preventDefault();
				
					// console.log(mail);
					var csrf_token = $("input[name='csrfmiddlewaretoken']").val();
					
					$.ajax({
						type: "POST",
						// url: "{% url 'core:subscribe' %}",
						url: "/users/checkout",
						data: {
							"csrfmiddlewaretoken": csrf_token,
							"phone": $("input[name='phone']").val(),
							"email": $("input[name='email']").val(),
							"total": parseFloat(total_price.text()),
							"country": "AZ",
							"products_quantity": 1,
							"street": $("input[name='street']").val(),
							"city": $("input[name='city']").val(),
							"building": 1,
							"zip": 2,
							"payment": 3,
							"promo_code": $("input[name='promo_code']").val(),
							"status": "",
							"complete": false
						},
					   
						dataType: 'json',
						// success: function (response) {
						// 	$("#subscribe").trigger('reset');
						// 	$("#message").html(response.message)
					   
						// },
						// error: function (response) {
						//     alert("zsxdcfvgbhnj");
						// }
					});
				});
			});

		


    


console.log( $(".total span").val());




	// console.log({
	// 	"user": user_id,
	// 	"phone": $("input[name='phone']").val(),
	// 	"email": $("input[name='email']").val(),
	// 	"total": total,
	// 	"country": "AZ",
	// 	"products_quantity": 0,
	// 	"street": $("input[name='street']").val(),
	// 	"city": $("input[name='city']").val(),
	// 	"building": $("input[name='building']").val(),
	// 	"zip": $("input[name='zip']").val(),
	// 	"payment": 3,
	// 	"promo_code": $("input[name='promo_code']").val(),
	// 	"products": [1]
	// });
	
// });

// async function postData(url, data = {}) {
// 	// Default options are marked with *
// 	const response = await fetch(url, {
// 	  method: 'POST', // *GET, POST, PUT, DELETE, etc.
// 	  mode: 'cors', // no-cors, *cors, same-origin
// 	  cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
// 	  credentials: 'same-origin', // include, *same-origin, omit
// 	  headers: {
// 		'Content-Type': 'application/json'
// 		// 'Content-Type': 'application/x-www-form-urlencoded',
// 	  },
// 	  redirect: 'follow', // manual, *follow, error
// 	  referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
// 	  body: JSON.stringify(data) // body data type must match "Content-Type" header
// 	});
// 	return response.json(); // parses JSON response into native JavaScript objects
//   }
  
//   const data = new FormData();
//   data.append({
// 	  "phone":"",

//   })

//   postData('http://127.0.0.1:8000/users/checkout/', { answer: 42 })
// 	.then((data) => {
// 	  console.log(data); // JSON data parsed by `data.json()` call
// 	});