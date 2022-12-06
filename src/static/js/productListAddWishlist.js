const productProductGrid = document.querySelector('#filtered_products');

productProductGrid.addEventListener('click', (event) => {
    let wishlistBtn = event.target.closest(".favorites");

    if (wishlistBtn) 
    {
        if (user_id != null && user_id != 1)
        {
            var wishProduct = event.target.parentNode.parentNode.lastElementChild.firstElementChild.innerText;
            fetch('http://127.0.0.1:8000/api/product/')
            .then((response) => response.json())
            .then((productList) => productList.map((product) => {
                if ( product.title.toLowerCase() == wishProduct.toLowerCase() ){
                    var indexWishlistItemCount = document.querySelector('#wishlistItemCount');
                    if (event.target.parentNode.getAttribute('data-favorite') == "inactive"){
                        event.target.parentNode.setAttribute('data-favorite', 'active');
                    }
                    else {
                        event.target.parentNode.setAttribute('data-favorite', 'inactive');
                    }
                    if (event.target.parentNode.getAttribute('data-favorite') == "active"){
                        console.log("POST REQUEST SENDED");
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
                        console.log("DELETE REQUEST SENDED");
                        fetch('http://127.0.0.1:8000/api/wishlist/').then((response) => response.json()).then((list) => list.map(item => {
                            if (item.user == user_id && item.product.id == product.id) {
                                console.log("DELETE REQUEST SENDED");
                                (async () => {
                                    const rawResponse = await fetch(`http://127.0.0.1:8000/api/wishlist/${item.id}`, {
                                      method: 'DELETE',
                                    });

                                    console.log("WISHLIST PRODUCT DELETED");
                                  })();
                                  indexWishlistItemCount.innerText--;
                            }
                        }));

                    }
                }
            }));

        }


    }
});
