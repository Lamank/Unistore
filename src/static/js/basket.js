var productCountInBasket = document.querySelector(".label");
const delay = ms => new Promise(res => setTimeout(res, ms));
const user_id = JSON.parse(document.getElementById('user_id').textContent);

(async () => {
  await delay(500);
  var productNames = document.querySelectorAll(".productName");
  console.log("USER_ID: " + user_id);
  console.log(productNames);


  console.log(basket);
  if (basket == null) {
    basket = [];
  }


  

  if (user_id != null && user_id != 1){
    console.log("USER IS AUTHENTICATED");
    var counter = 0;

    basket.forEach(product => {
      if (product.user_id === user_id){
        counter++;
        console.log(product.user_id + " " + product.title + " " + user_id);
        console.log(counter);
        fetch('http://127.0.0.1:8000/api/category/').then((response) => response.json())
        .then((data) => data.map((category) => {

            if (category.id == product.category.id){

              productNames.forEach(productName => {
                console.log(productName);
                  if (productName.innerHTML.toLowerCase() === product.title.toLowerCase() && _pj.in_es6("products", window.location.href) ) {
                    if (productName.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling != null)
                    {
                      if (productName.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.innerText === " Add to cart"){
                        productName.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.disabled = true;
                        productName.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.innerText = "Added";
                      }
                    }

                }
            });
            let percent = ""
            if(product.discounted_price === 0.0){
              percent =  `<p class="price">${product.price} </p>`
             
            }else{
              percent = `
              <p class="price ">${Number(product.discounted_price).toFixed(2)}</p> 
              `
            }
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
                    <input type="text" class="form-control input-sm" placeholder="Qty" value="1" readonly="">
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
            console.log(productDataCountInBasket);
            console.log(counter);
            productCountInBasket.lastChild.textContent = ` ${counter}\n    `;
          
        }));}
    });
  
  }
  else {
    productCountInBasket.lastChild.textContent = ` ${0}\n    `;
  }
})();
 

function removeObjectWithId(arr, id) {
  const objWithIdIndex = arr.findIndex((obj) => obj.id === id);
  arr.splice(objWithIdIndex, 1);

  return arr;
}


if (_pj.in_es6("products", window.location.href)){
  function removeFromCart(element){
    var productNames = document.querySelectorAll(".productName");
    console.log(productNames);
    var removedProduct = element.parentElement.previousElementSibling.firstElementChild.innerHTML;
    console.log(removedProduct);
    // var basket = JSON.parse(localStorage.getItem("basket"));
    console.log(basket);
    console.log(removedProduct);
    localStorage.removeItem("basket");
    productNames.forEach(product => {
      console.log(product);
      console.log(85);
      if (removedProduct.toLowerCase() == product.innerHTML.toLocaleLowerCase()){
        console.log(window.location.href);
        console.log("86");
        if ( product.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.disabled == true ){
          product.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.disabled = false;
          product.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.innerHTML = "Add to Cart";
        }
        else {
          console.log("PRODUCT DETAIL PAGE REMOVE BTN CLICKED");
          console.log(product.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.innerText);
          console.log(product.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.innerText);
          if (product.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.innerText == "Added"){
            product.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.disabled = false;
            product.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.innerText = " Add to cart";    
          }
          else if (product.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.innerText == "Added"){
            product.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.disabled = false;
            product.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.innerText = " Add to cart";       
          }
        }

  
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
                if (userCart.id ==  cartItem.cart){
                  console.log("IF " + cartItem.product + " == " + prod.id);
                  if (cartItem.product === prod.id){
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
                    console.log("IF " + userCart.id + " == " + cartItem.cart);
                    if (userCart.id ==  cartItem.cart){
                      console.log("IF " + cartItem.product + " == " + prod.id);
                      if (cartItem.product === prod.id){
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
            console.log("IF " + userCart.id + " == " + cartItem.cart);
            if (userCart.id ==  cartItem.cart){
              console.log("IF " + cartItem.product + " == " + prod.id);
              if (cartItem.product === prod.id){
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

