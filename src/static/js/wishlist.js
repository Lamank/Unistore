const indexProductsGrid = document.querySelector('#productsGrid');
const indexProductsNames = document.querySelectorAll('.productName');

if (user_id != null && user_id  != 1) {
    fetch('http://127.0.0.1:8000/api/wishlist/').then((response) => response.json()).then((products) => products.map(item => {
        console.log(user_id + " == " + item.user);
        if (user_id == item.user){
            for (elem of indexProductsNames){
                if (item.product.title.toLowerCase() == elem.innerText.toLowerCase()){
                    elem.offsetParent.firstElementChild.setAttribute('data-favorite', 'active');
                };
            };
        };
    }));
}

indexProductsGrid.addEventListener("click", (clickEvent) => {
    let wishlistButton = clickEvent.target.closest(".favorites");

    if (wishlistButton){
        if (user_id != null && user_id != 1){
            var addedProduct = clickEvent.target.parentNode.lastElementChild.firstElementChild.innerText;
           
            fetch('http://127.0.0.1:8000/api/product/')
            .then((response) => response.json())
            .then((productList) => productList.map((product) => {
               
                if ( product.title.toLowerCase() == addedProduct.toLowerCase() ){
                    var indexWishlistItemCount = document.querySelector('#wishlistItemCount');
                    
                    if (clickEvent.target.getAttribute('data-favorite') == "active"){
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
                        // const content = await rawResponse.json();
                      
                        // console.log(JSON.parse(content));
                      })();

                      indexWishlistItemCount.innerText++; 
                    }
                    else {
                        fetch('http://127.0.0.1:8000/api/wishlist/').then((response) => response.json()).then((list) => list.map(item => {
                            if (item.user == user_id && item.product.id == product.id) {
                                
                                (async () => {
                                    const rawResponse = await fetch(`http://127.0.0.1:8000/api/wishlist/${item.id}`, {
                                      method: 'DELETE',
                                    });

                                  })();
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
