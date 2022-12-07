
var _filterObj = {};
var urlstring = ""

$('.filter-checkbox, #slider-price').on('click', function(){
  
    _filterObj.min_price = $( "#slider-price" ).slider( "values", 0 );
    _filterObj.max_price = $( "#slider-price" ).slider( "values", 1 );
    var _filterKey = $(this).find('input').data('filter');
    var _inputStatus = $(this).find('input');
 
    if(!_inputStatus.attr("checked")){
        _inputStatus.attr("checked", "checked");
    }
    else{
        _inputStatus.removeAttr("checked");
    }
    
    _filterObj[_filterKey] = Array.from($('input[data-filter=' + _filterKey + ']:checked' )).map(function(el){
        return el.value;
    });

   
    fetch_function(generate_url());
});

$('.tags').on('click', 'li', function(){

    _filterObj.order = $(this).find('a').attr('data-filter');
    _filterObj.value = $(this).find('a').attr('data-value');
    fetch_function(generate_url());
});

$('.tags').on('click', 'label', function(){
    _filterObj.tag = $(this).find('input').attr('data-value');
    fetch_function(generate_url()); 
});

$(".title").on("click", "a", function(){
    let children = $(this).parent().next().children();
    let removeField =children.data("filter");
    delete _filterObj[removeField];

    children.each(function() {
        $(this).find("input").removeAttr("checked");
        console.log($(this).find("input").attr("checked"));
    });
    fetch_function(generate_url());

});



// if (window.performance) {
//     let string = window.location.href.split("?")[1];
//     urlstring = "?" + string

//     console.log('urlstring',urlstring.length);
        
//     fetch_function(urlstring)
// }

function generate_url() {
    urlstring = "";
    campaign();
    for (const [key, value] of Object.entries(_filterObj)) {
        urlstring+=`&${key}=${value}`
    };

    console.log(_filterObj);
    urlstring = urlstring.replace(urlstring.charAt(0), "?");
    history.pushState(
        null,
        null,
        urlstring
    )
    return urlstring
}
function campaign(){
    if(window.location.href.includes("?campaign=")){
        let value = window.location.href.split("?", 10)[1]
        // console.log(campaign.slice(-1));
        value = value.split("=")
        _filterObj.campaign = value[1]
        // console.log();
        // urlstring = "&";
    }
}
function fetch_function(urlstring){
   
    fetch(`http://127.0.0.1:8000/api/product/${urlstring}`)     
    // fetch(urlstring)  
    .then((response) =>{
        return response.json();
    } )
    .then((data) => {
        let htmlString = "";
        $("#filtered_products").html('');
        if (data.length > 0){
            for(let i = 0; i < data.length; i ++){
                let img = ""
                let percent = ""
                if (data[i]["campaign"] && data[i]["campaign"]['name'] == "Black Friday" ) {
                    img = `<img src="${ data[i]["campaign"].extra_image }" id="campaign_image" alt="${ data[i].title }"> `
                } 
                if(data[i]['discounted_price'] != 0.0){
                   
                    percent = `
                    <p class="price ">${ Number(data[i].discounted_price).toFixed(2) }</p> 
                    <p class="price through">${ data[i].price }</p>
                    `
                }
                else{
                    percent =  `<p class="price">${ data[i].price } </p>`
                }
                htmlString += 
                `
                <div class="col-sm-6 col-md-4 product parent">
                <div class="body " id="prod_image">
                  <a href="#favorites" class="favorites" data-favorite="inactive"><i class="ion-ios-heart-outline"></i></a>
                  <a href="${ data[i].slug }/" class="image-height" >
                    
                    <img src="${ data[i].main_image }"  alt="${ data[i].title }"> 
                   
                  </a>
                  ${img}
                  <div class="content">
                    <h1 class="h3 productName">${ data[i].title }</h1>
                    ${ percent }
                    <label>${ data[i]["brand"].name.charAt(0).toUpperCase()+ data[i]["brand"].name.slice(1)} </label>
                    <a href="${ data[i].slug }/">
                      <button class="btn btn-link" formaction=""> <i class="ion-android-open"></i> Details</button>
                    </a>
                    <button class="btn btn-primary btn-sm rounded addToCart"> <i class="ion-bag"></i> Add to cart</button>
                  </div>
                </div>
              </div>
                `
            }
        }
        else{
            htmlString = '<p style="font-size:35px; text-align:center; font-weight:bolder;  " >There is no product</p>';
        }
        

        $("#filtered_products").html(htmlString)
    }).then(responseJson => {
        var wishProductNames = document.querySelectorAll(".productName");
        // console.log(wishProductNames);
        fetch('http://127.0.0.1:8000/api/wishlist/').then((response) => response.json()).then(wishItem => wishItem.map(item => {
            if (wishProductNames[0].parentNode != null){
                for (product of wishProductNames) {
                    if (item.product.title.toLowerCase() == product.innerText.toLowerCase()) {
                        product.offsetParent.firstElementChild.setAttribute('data-favorite', 'active');
                    }
                }
            }

        }));
    })
}   
