const productProductGrid = document.querySelector('#filtered_products');

productProductGrid.addEventListener('click', (event) => {
    let wishlistBtn = event.target.closest(".favorites");

    if (wishlistBtn) 
    {
        if (user_id != null && user_id != 1)
        {
            var wishProduct = event.target.parentNode.lastElementChild.firstElementChild.innerText;
            fetch('http://127.0.0.1:8000/api/product/')
            .then((response) => response.json())
            .then((productList) => productList.map((product) => {
                if ( product.title.toLowerCase() == wishProduct.toLowerCase() ){
                    var indexWishlistItemCount = document.querySelector('#wishlistItemCount');
                    if (event.target.getAttribute('data-favorite') == "inactive"){
                        event.target.setAttribute('data-favorite', 'active');
                    }
                    else {
                        event.target.setAttribute('data-favorite', 'inactive');
                    }
                    if (event.target.getAttribute('data-favorite') == "active"){
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
                        
                            // console.log(JSON.parse(JSON.parse(content)));
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


    }
});
