let favoritesLiItem = document.querySelector("#favoritesPageLiTag");
let wishlistItemCounter = 0;

fetch('http://127.0.0.1:8000/api/wishlist/').then((response) => response.json()).then(wishlist => wishlist.map(item => {
    if (user_id === item.user) {
        wishlistItemCounter++;
    }
}
)).then(responseJson => {
    favoritesLiItem.innerHTML = 
    `<a style="display: flex; width: 100%; justify-content: space-between;" href="/users/wishlist">
    Favorites 
    <span id="wishlistItemCount" style="border: 1px solid #FF5C5C; border-radius: 50%; background-color: #FF5C5C; width: 22px; text-align: center; color: black; font-weight: bold;"> ${ wishlistItemCounter}</span> 
    </a>`;
});
