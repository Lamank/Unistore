var productCountInBasket = document.querySelector(".label");
const delay = ms => new Promise(res => setTimeout(res, ms));
const user_id = JSON.parse(document.getElementById('user_id').textContent);
var cartRemovedProduct = "";

(async () => {
  await delay(500);
  var productNames = document.querySelectorAll(".productName");
  console.log("USER_ID: " + user_id);

  if (basket == null) {
    basket = [];
  }

  if (user_id != null && user_id != 1){
    console.log("USER IS AUTHENTICATED");
    var counter = 0;

    basket.forEach(product => {
      if (product.user_id === user_id){
        counter++;
        fetch('http://127.0.0.1:8000/api/category/').then((response) => response.json())
        .then((data) => data.map((category) => {
            if (category.id == product.category.id){
              productNames.forEach(productName => {
                console.log(productName);
                  if (productName.innerHTML.toLowerCase() === product.title.toLowerCase() && _pj.in_es6("products", window.location.href) ) {
                    const btnBox = productName.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;
                    addToCartBtn = btnBox.innerText === " Add to cart" ? btnBox : btnBox.nextElementSibling;
                    console.log(addToCartBtn);
                    if (addToCartBtn != null)
                    {
                      addToCartBtn.disabled = true;
                      addToCartBtn.innerText = "Added";
                    };
                };
            });
            let percent = "";
            if(product.discounted_price === 0.0){
              percent =  `<p class="price">${product.price} </p>`;
             
            }else{
              percent = `
              <p class="price ">${Number(product.discounted_price).toFixed(2)}</p> 
              `;
            };
              cart.firstChild.firstChild.innerHTML += `
              <div class="media">
                <div class="media-left">
                  <a href="${product.slug}">
                    <img class="media-object" src="${product.main_image}" alt="${product.title}" />
                  </a>
                </div>
                <div class="media-body">
                  <h2 class="h4 media-heading">${product.title}</h2>
                  <label>${category.name}</label>
                  ${percent}
                </div>
                <div class="controls">
                  <div class="input-group">
                    <span class="input-group-btn">
                      <button class="btn btn-default btn-sm" type="button" data-action="minus"><i
                          class="ion-minus-round"></i></button>
                    </span>
                    <input type="text" class="form-control input-sm" placeholder="Qty" value="${product.quantity}" readonly="">
                    <span class="input-group-btn">
                      <button class="btn btn-default btn-sm" type="button" data-action="plus"><i
                          class="ion-plus-round"></i></button>
                    </span>
                  </div>
                  <a href="#remove" class="removeProduct" onclick="removeFromCart(this)"> <i class="ion-trash-b"></i> Remove </a>
                </div>
              </div>`;
            }
            productDataCountInBasket = basket.length;
            productCountInBasket.lastChild.textContent = ` ${counter}\n    `;
        }));
      }});
  }
  else {
    productCountInBasket.lastChild.textContent = ` ${0}\n    `;
  };
})();

function removeObjectWithId(arr, id) {
  const objWithIdIndex = arr.findIndex((obj) => obj.id === id);
  arr.splice(objWithIdIndex, 1);

  return arr;
}

if (_pj.in_es6("products", window.location.href)){
  function removeFromCart(element){
    var productNames = document.querySelectorAll(".productName");
    var removedProduct = element.parentElement.previousElementSibling.firstElementChild.innerHTML;
    localStorage.removeItem("basket");
    productNames.forEach(product => {
      if (removedProduct.toLowerCase() == product.innerHTML.toLocaleLowerCase()){
        console.log(window.location.href);
        cartRemovedProduct = product.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;
        
        if (cartRemovedProduct.disabled == true)
        {cartRemovedProduct = cartRemovedProduct;}
        else if (cartRemovedProduct.nextElementSibling.disabled == true)
        {cartRemovedProduct = cartRemovedProduct.nextElementSibling;}
        else if(cartRemovedProduct.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.disabled == true)
        {cartRemovedProduct = cartRemovedProduct.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;}
        else {cartRemovedProduct = cartRemovedProduct.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling}
        
        cartRemovedProduct.disabled = false;
        cartRemovedProduct.innerHTML = "Add to Cart";
        basket.forEach(prod => {
          console.log(91);
          console.log(prod.title);
          if (prod.title.toLowerCase() == removedProduct.toLowerCase()){
            console.log(93);
            console.log(basket);
            removeObjectWithId(basket, prod.id);
            fetch('http://127.0.0.1:8000/api/cart-item').then((response) => response.json())
            .then((data) => data.map(cartItem => {
              fetch('http://127.0.0.1:8000/api/cart/').then(response => response.json()).then(cart => cart.map(userCart => {
                console.log("IF " + userCart.id + " == " + cartItem.cart.id);
                if (userCart.id ==  cartItem.cart.id){
                  console.log("IF " + cartItem.product.id + " == " + prod.id);
                  if (cartItem.product.id === prod.id){
                    (async () => {
                        await fetch(`http://127.0.0.1:8000/api/cart-item/${cartItem.id}`, {
                        method: 'DELETE',
                      });
                      console.log("ITEM DELETED");
                    })();
                  }
                }
              }));
              }));
            console.log(basket);
            localStorage.setItem("basket", JSON.stringify(basket));
            productDataCountInBasket = basket.length;
            console.log(productDataCountInBasket);
            productCountInBasket.lastChild.textContent = ` ${productDataCountInBasket}\n    `;
          }
        });
      }
      else {
        console.log(window.location.href);
        var productNames = [];
        basket.forEach(product => {
          productNames.push(product.title);
        });
        console.log(productNames);
        productNames.forEach(product => {
          console.log(product);
          console.log(85);
          if (removedProduct.toLowerCase() == product.toLocaleLowerCase()){
            console.log("86");
            basket.forEach(prod => {
              console.log(91);
              if (prod.title.toLowerCase() == removedProduct.toLowerCase()){
                console.log(93);
                console.log(basket);
                removeObjectWithId(basket, prod.id);
                fetch('http://127.0.0.1:8000/api/cart-item').then((response) => response.json())
                .then((data) => data.map(cartItem => {
                  fetch('http://127.0.0.1:8000/api/cart/').then(response => response.json()).then(cart => cart.map(userCart => {
                    console.log("IF " + userCart.id + " == " + cartItem.cart.id);
                    if (userCart.id ==  cartItem.cart.id){
                      console.log("IF " + cartItem.product.id + " == " + prod.id);
                      if (cartItem.product.id === prod.id){
                        (async () => {
                            await fetch(`http://127.0.0.1:8000/api/cart-item/${cartItem.id}`, {
                            method: 'DELETE',
                          });
                          console.log("ITEM DELETED");
                        })();
                      }
                    }
                  }));
                  }));
                console.log(basket);
                localStorage.setItem("basket", JSON.stringify(basket));
                productDataCountInBasket = basket.length;
                console.log(productDataCountInBasket);
                productCountInBasket.lastChild.textContent = ` ${productDataCountInBasket}\n    `;
              }
            });
          }})
      }
    }
    );
  
  }
}
else {
  function removeFromCart(element){
    var productNamesData = JSON.parse(localStorage.getItem("basket"));
    var productNames = [];
    productNamesData.forEach(product => {
      productNames.push(product.title);
    })
    var removedProduct = element.parentElement.previousElementSibling.firstElementChild.innerHTML;
    var basket = JSON.parse(localStorage.getItem("basket"));
    console.log(basket);
    localStorage.removeItem("basket");
    productNames.forEach(_product => {
    basket.forEach(prod => {
      if (prod.title.toLowerCase() == removedProduct.toLowerCase()){
        console.log(basket);
        removeObjectWithId(basket, prod.id);
        fetch('http://127.0.0.1:8000/api/cart-item').then((response) => response.json())
        .then((data) => data.map(cartItem => {
          fetch('http://127.0.0.1:8000/api/cart/').then(response => response.json()).then(cart => cart.map(userCart => {
            console.log("IF " + userCart.id + " == " + cartItem.cart.id);
            if (userCart.id ==  cartItem.cart.id){
              console.log("IF " + cartItem.product.id + " == " + prod.id);
              if (cartItem.product.id === prod.id){
                (async () => {
                    await fetch(`http://127.0.0.1:8000/api/cart-item/${cartItem.id}`, {
                    method: 'DELETE',
                  });
                  console.log("ITEM DELETED");
                })();
              }
            }
          }));
          }));
        console.log(basket);
        localStorage.setItem("basket", JSON.stringify(basket));
        productDataCountInBasket = basket.length;
        console.log(productDataCountInBasket);
        productCountInBasket.lastChild.textContent = ` ${productDataCountInBasket}\n    `;
      }
    });
    });
  }
}
