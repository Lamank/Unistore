var cart = document.querySelector("#cart");
var productCountInBasket = document.querySelector(".label");
var productCounter = 0;
var _pj;
var addToCartBtn = ''

function _pj_snippets(container) {
  function in_es6(left, right) {
    if (right instanceof Array || typeof right === "string") {
      return right.indexOf(left) > -1;
    } else {
      if (right instanceof Map || right instanceof Set || right instanceof WeakMap || right instanceof WeakSet) {
        return right.has(left);
      } else {
        return left in right;
      }
    }
  }

  container["in_es6"] = in_es6;
  return container;
}

function getProductCountInBasket(basket) {
  var productCount = 0;
  for (product of basket) {
    if (product.user_id === user_id) {
      productCount++;
    }
  }
  return productCount;
}


if (localStorage.getItem("basket") != null) {
  var basket = JSON.parse(localStorage.getItem("basket"));
}
else {
  var basket = [];
}

_pj = {};

_pj_snippets(_pj);

if (_pj.in_es6("products", window.location.href)) {

  const productsGrid = document.querySelector("#filtered_products");
  if (productsGrid) {
    productsGrid.addEventListener("click", (event) => {

      let product1 = event.target.closest(".addToCart");

      if (product1) {
        console.log(event.target);
        console.log("CLICKED ON A ADD TO CART BUTTON");
        var product = event.target.parentElement.firstElementChild.textContent;
        console.log(product);
        // ----- THIS IS WRITTEN FOR PRODUCT DETAIL PAGE TO GET THE PRODUCT NAME
        if (product.length === 0) {
          product = event.target.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling
            .previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.textContent
          console.log("PRODUCT DETAIL PAGE TO GET THE PRODUCT NAME");
        };
        // -----
        fetch('http://127.0.0.1:8000/api/product/').then((response) => response.json()).then((data) => data.map((prod) => {
          console.log(prod);
          console.log(product);
          if (prod.title.toLowerCase() == product.toLowerCase()) {
            let percent = "";
            if (prod.discounted_price === 0.0) {
              percent = `<p class="price">${prod.price} </p>`;

            } else {
              percent = `
                <p class="price ">${Number(prod.discounted_price).toFixed(2)}</p> 
                `;
            };
            productCounter++;
            cart.firstChild.firstChild.innerHTML += `<div class="media">
                      <div class="media-left">
                        <a href="#">
                          <img class="media-object" src="${prod.main_image}" alt="${prod.title}" />
                        </a>
                      </div>
                      <div class="media-body">
                        <h2 class="h4 media-heading">${prod.title}</h2>
                        <label>${prod.category.name}</label>
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
                        <a href="#remove" class="removeProduct" onclick="removeFromCart(this)> <i class="ion-trash-b"></i> Remove </a>
                      </div>
                    </div>`;
            function removeObjWithTitle(arr, title) {
              const objWithIdIndex = arr.findIndex((obj) => obj.title === title);
              arr.splice(objWithIdIndex, 1);

              return arr;
            }
            var prodNames = document.querySelectorAll(".productName");
            console.log(window.location.href);
            console.log(prodNames);

            var removeBtns = document.querySelectorAll('.removeProduct').forEach(element => element
              .addEventListener('click', (removeEvent) => {
                console.log("REMOVE BTN IS WORKING");
                var btnItemTitle = removeEvent.target.parentNode.previousElementSibling.firstElementChild.innerText;
                console.log(btnItemTitle);

                for (elem of basket) {
                  if (elem.title.toLowerCase() === btnItemTitle.toLowerCase()) {
                    var removedItemTitle = elem.title;
                    var elemData = elem;
                  }
                }
                console.log(removedItemTitle);
                console.log(basket);
                if (removedItemTitle != null) {
                  localStorage.removeItem("basket");
                  removeObjWithTitle(basket, removedItemTitle);
                  fetch('http://127.0.0.1:8000/api/cart-item').then((response) => response.json())
                    .then((data) => data.map(cartItem => {
                      fetch('http://127.0.0.1:8000/api/cart/').then(response => response.json()).then(cart => cart.map(userCart => {
                        console.log("IF " + userCart.id + " == " + cartItem.cart.id);
                        if (userCart.id == cartItem.cart.id) {
                          console.log("IF " + cartItem.product.id + " == " + elemData.id);
                          if (cartItem.product.id === elemData.id) {
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
                  console.log(getProductCountInBasket(basket));
                  productCountInBasket.lastChild.textContent = ` ${getProductCountInBasket(basket)}\n    `;
                  prodNames.forEach(prodName => {
                    if (removedItemTitle.toLowerCase() === prodName.innerHTML.toLowerCase()) {
                      addToCartBtn = prodName.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;
                      addToCartBtn = addToCartBtn.innerText === "Added" ? addToCartBtn : addToCartBtn.nextElementSibling;
                      if (addToCartBtn != null && addToCartBtn.innerText == "Added") {
                        console.log("ENTERS IF");
                        addToCartBtn.innerHTML = " Add to Cart";
                        addToCartBtn.disabled = false;
                      }
                      else {
                        addToCartBtn = prodName.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.
                          nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;
                        addToCartBtn.disabled = false;
                        addToCartBtn.innerText = "Add to Cart";
                      };
                    };
                  });
                };
              }));

            if (user_id != null && user_id != 1) {
              fetch('http://127.0.0.1:8000/api/cart/').then(response => response.json()).then(cart => cart.map(cartData => {
                if (cartData.owner === user_id) {
                  console.log("IF " + cartData.owner + " " + user_id);
                  console.log(prod.id);
                  (async () => {
                    const rawResponse = await fetch('http://127.0.0.1:8000/api/cart-item/', {
                      method: 'POST',
                      headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json'
                      },
                      body: JSON.stringify({ 'cart': cartData.id, 'product': prod.id, 'quantity': 1 })
                    });
                    const content = await rawResponse.json();

                    console.log(content);
                  })();
                  prod.user_id = user_id;
                  console.log(prod);
                  basket.push(prod);
                  console.log(basket);
                  event.target.disabled = true;
                  event.target.innerHTML = "Added";
                  localStorage.setItem("basket", JSON.stringify(basket));
                  console.log(productCounter);
                  console.log(getProductCountInBasket(basket));
                  productCountInBasket.lastChild.textContent = ` ${getProductCountInBasket(basket)}\n    `;
                }
              }));
            }
            else {
              console.log("THIS IS EXECUTE FIRST THAN LOCALSTORAGE");
              window.location.replace("http://127.0.0.1:8000/users/register");
            }
          };
        }
        )
        );
      };
    }
    );
  }

  else {
    var addBtns = document.querySelectorAll('.addToCart')
    console.log(addBtns);
    addBtns.forEach(el => el.addEventListener("click", (event) => {
      console.log("CLICKED ON A ADD TO CART BUTTON");
      var product = el.parentElement.firstElementChild.textContent;
      // ----- THIS IS WRITTEN FOR PRODUCT DETAIL PAGE TO GET THE PRODUCT NAME
      if (product.length === 0) {
        if (el.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling
          .previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.textContent != "") {
          product = el.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling
            .previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.textContent;
        }
        else {
          product = el.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling
            .previousElementSibling.previousElementSibling.previousElementSibling.previousElementSibling.textContent;
        }
        console.log("PRODUCT DETAIL PAGE TO GET THE PRODUCT NAME");
      }
      console.log(product);
      // -----
      fetch('http://127.0.0.1:8000/api/product/').then((response) => response.json()).then((data) => data.map((prod) => {
        if (prod.title.toLowerCase() == product.toLowerCase()) {
          console.log(prod.price);
          cart.firstChild.firstChild.innerHTML += `<div class="media">
                    <div class="media-left">
                      <a href="#">
                        <img class="media-object" src="${prod.main_image}" alt="${prod.title}" />
                      </a>
                    </div>
                    <div class="media-body">
                      <h2 class="h4 media-heading">${prod.title}</h2>
                      <label>${prod.category.name}</label>
                      <p class="price">$${prod.price}</p>
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
                      <a href="#remove" class="removeProduct" onclick="removeFromCart(this)> <i class="ion-trash-b"></i> Remove </a>
                    </div>
                  </div>`;
          function removeObjWithTitle(arr, title) {
            const objWithIdIndex = arr.findIndex((obj) => obj.title === title);
            arr.splice(objWithIdIndex, 1);

            return arr;
          }
          var prodNames = document.querySelectorAll(".productName");
          console.log(window.location.href);
          console.log(prodNames);

          var removeBtns = document.querySelectorAll('.removeProduct').forEach(element => element
            .addEventListener('click', (removeEvent) => {
              console.log("REMOVE BTN IS WORKING");
              var btnItemTitle = removeEvent.target.parentNode.previousElementSibling.firstElementChild.innerText;
              console.log(btnItemTitle);

              for (elem of basket) {
                if (elem.title.toLowerCase() === btnItemTitle.toLowerCase()) {
                  var removedItemTitle = elem.title;
                  var elemData = elem;
                }
              }
              console.log(removedItemTitle);
              console.log(basket);
              if (removedItemTitle != null) {
                localStorage.removeItem("basket");
                removeObjWithTitle(basket, removedItemTitle);
                fetch('http://127.0.0.1:8000/api/cart-item').then((response) => response.json())
                  .then((data) => data.map(cartItem => {
                    fetch('http://127.0.0.1:8000/api/cart/').then(response => response.json()).then(cart => cart.map(userCart => {
                      console.log("IF " + userCart.id + " == " + cartItem.cart.id);
                      if (userCart.id == cartItem.cart.id) {
                        console.log("IF " + cartItem.product.id + " == " + elemData.id);
                        if (cartItem.product.id === elemData.id) {
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
                console.log(getProductCountInBasket(basket));
                productCountInBasket.lastChild.textContent = ` ${getProductCountInBasket(basket)}\n    `;
                prodNames.forEach(item => {
                  if (removedItemTitle.toLowerCase() === item.innerHTML.toLowerCase()) {
                    addToCartBtn = item.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;
                    if (addToCartBtn.innerHTML == "Added") {
                      console.log("ENTERS IF");
                      addToCartBtn.innerHTML = "Add to Cart";
                      addToCartBtn.disabled = false;
                    }
                    else {
                      addToCartBtn = item.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.
                        nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling;
                      addToCartBtn = addToCartBtn.innerText == "Added" ? addToCartBtn : addToCartBtn.nextElementSibling;
                      addToCartBtn.disabled = false;
                      addToCartBtn.innerText = " Add to cart";
                    };
                  };
                });
              };
            }));
        };
      }));
      if (user_id != null && user_id != 1) {
        fetch('http://127.0.0.1:8000/api/cart/').then(response => response.json()).then(cart => cart.map(cartData => {
          if (cartData.owner === user_id) {
            console.log("IF " + cartData.owner + " " + user_id);
            console.log(prod.id);
            (async () => {
              const rawResponse = await fetch('http://127.0.0.1:8000/api/cart-item/', {
                method: 'POST',
                headers: {
                  'Accept': 'application/json',
                  'Content-Type': 'application/json'
                },
                body: JSON.stringify({ 'cart': cartData.id, 'product': prod.id, 'quantity': 1 })
              });
              const content = await rawResponse.json();

              console.log(content);
            })();
            prod.user_id = user_id;
            console.log(prod);
            basket.push(prod);
            console.log(basket);
            event.target.disabled = true;
            event.target.innerHTML = "Added";
            localStorage.setItem("basket", JSON.stringify(basket));
            console.log(productCounter);
            console.log(getProductCountInBasket(basket));
            productCountInBasket.lastChild.textContent = ` ${getProductCountInBasket(basket)}\n    `;
          }
        }));
      }
      else {
        console.log("THIS IS EXECUTE FIRST THAN LOCALSTORAGE");
        window.location.replace("http://127.0.0.1:8000/users/register");
      };

    }));
  }

};
