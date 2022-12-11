const cartGrid = document.querySelector('#cart');

if (cartGrid) {
    cartGrid.addEventListener('click', (event) => {
        let quantityBtn = event.target.closest(".input-group-btn");
        var changedProduct = quantityBtn.parentNode.parentNode.previousElementSibling.firstElementChild.innerText;
        if (quantityBtn.firstElementChild.dataset.action == 'plus'){
          console.log(quantityBtn.previousElementSibling.value);
          var productCountInCart = parseInt(quantityBtn.previousElementSibling.value) + 1;
        }
        else {
          console.log(quantityBtn.nextElementSibling.value);
          if (quantityBtn.nextElementSibling.value != 1){
            var productCountInCart = parseInt(quantityBtn.nextElementSibling.value) - 1;
          }
          else {
            var productCountInCart = parseInt(quantityBtn.nextElementSibling.value);
          }

        }
        fetch('http://127.0.0.1:8000/api/cart/').then((response) => response.json()).then(carts => carts.map(cart => {
            if (cart.owner == user_id){
                fetch('http://127.0.0.1:8000/api/cart-item').then((response) => response.json()).then(cartItems => cartItems.map(cartItem => {
                    console.log(cartItem.cart.id, cart.id, cartItem.product.title, changedProduct);
                    if (cartItem.cart.id == cart.id && cartItem.product.title.toLowerCase() == changedProduct.toLowerCase()){
                        (async () => {
                            const rawResponse = await fetch(`http://127.0.0.1:8000/api/cart-item/${cartItem.id}`, {
                              method: 'PATCH',
                              headers: {
                                'Accept': 'application/json',
                                'Content-Type': 'application/json'
                              },
                              body: JSON.stringify({'quantity': productCountInCart})
                            });
                            const content = await rawResponse.json();
                          
                            console.log(content);
                          })();
                          basket = basket.map(object => {
                            if (object.id === cartItem.product.id) {
                              console.log(object);
                              console.log(productCountInCart);
                              object.quantity = productCountInCart;
                              return object;
                            }
                            return object;
                          });
                          localStorage.removeItem("basket");
                          localStorage.setItem("basket", JSON.stringify(basket));
                    }
                }));
            }
        }));
    })
}
