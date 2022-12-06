let productsRow = document.querySelector("#productsRow");
console.log(productsRow);

if (user_id != null) 
{
    fetch('http://127.0.0.1:8000/api/wishlist/').then((response) => response.json())
    .then(wishlist =>wishlist.map(item => 
        {
            if (item.user == user_id){
                console.log("HTML BE READY");
                productsRow.innerHTML += 
                `
                <div class="col-sm-6 col-md-4 product">
                    <div class="body">
                        <a href="#favorites" class="favorites" data-favorite="active"><i class="ion-ios-heart-outline"></i></a>
                        <a href="/products/${item.product.slug}"><img src="${item.product.main_image}" alt="${item.product.title}"/></a>

                        <div class="content align-center">
                            <p class="price">$${item.product.price}</p>
                            <h2 class="h3">${item.product.title}</h2>
                            <hr class="offset-sm">

                            <button class="btn btn-link"> <i class="ion-android-open"></i> Details</button>
                        </div>
                    </div>
                </div>
                `
            }   
        }
    ));
}

productsRow.addEventListener("click", (clickEvent) => {
    let wishlistButton = clickEvent.target.closest(".favorites");

    if (wishlistButton){
        if (user_id != null && user_id != 1){
            var addedProduct = clickEvent.target.parentNode.offsetParent.lastElementChild.firstElementChild.nextElementSibling.innerText;
            fetch('http://127.0.0.1:8000/api/product/')
            .then((response) => response.json())
            .then((productList) => productList.map((product) => {
                if ( product.title.toLowerCase() == addedProduct.toLowerCase() ){
                    var indexWishlistItemCount = document.querySelector('#wishlistItemCount');
                    if (clickEvent.target.parentNode.getAttribute('data-favorite') == "inactive"){
                    (async () => {
                        const rawResponse = await fetch('http://127.0.0.1:8000/api/wishlist/', {
                          method: 'POST',
                          headers: {
                            'Accept': 'application/json',
                            'Content-Type': 'application/json'
                          },
                          body: JSON.stringify(
                            {
                                'product': product.id,
                                'user': user_id
                            }
                        )
                    });
                        const content = await rawResponse.json();
                      
                        console.log(JSON.parse(content));
                      })();
                      indexWishlistItemCount.innerText++;
                    }
                    else {
                        console.log("ENTERS ELSE IN WISHLIST");
                        fetch('http://127.0.0.1:8000/api/wishlist/').then((response) => response.json()).then((list) => list.map(item => {
                            console.log(item.user + "==" + user_id + "&&" + item.product.id + "==" + product.id);
                            if (item.user == user_id && item.product.id == product.id) {
                                console.log("DELETE REQUEST SENDED");
                                (async () => {
                                    const rawResponse = await fetch(`http://127.0.0.1:8000/api/wishlist/${item.id}`, {
                                      method: 'DELETE',
                                    });
                                    const content = await rawResponse.json();
                                  
                                    console.log(content);
                                    console.log("WISHLIST PRODUCT DELETED");
                                  })();
                                  console.log(indexWishlistItemCount);
                                  indexWishlistItemCount.innerText--;
                            }
                        }));

                    }
                }
            }));
        }
        else {
            window.location.replace("http://127.0.0.1:8000/users/register");
        }

    }
});
