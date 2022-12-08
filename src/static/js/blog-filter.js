var _filterObj = {};
var urlstring = "";


$('.tags').on('click', 'label', function(){
    _filterObj.tag = $(this).find('input').attr('data-value');
    urlstring = "";
    for (const [key, value] of Object.entries(_filterObj)) {
        urlstring+=`&${key}=${value}`
    };

    console.log(_filterObj);
    urlstring = urlstring.replace(urlstring.charAt(0), "?")
    history.pushState(
        null,
        null,
        urlstring
    )
    fetch_function(urlstring)  
});


// if (window.performance) {
//     let urlstring = window.location.href.split("?")[1];
//     urlstring = "?" + urlstring
//     fetch_function(urlstring)
// }

function fetch_function(urlstring){
   
    fetch(`http://127.0.0.1:8000/api/blog/${urlstring}`)     
    .then((response) =>{
        return response.json();
    } )
    .then((data) => {
        let htmlString = "";
        $("#blogFilter").html('');

        for(let i = 0; i < data.length; i ++){
            htmlString += 
            `
            <div class="col-sm-6 col-md-6 item">

            <div class="body">
              <a href="${data[i].slug}/" class="view"><i class="ion-ios-book-outline"></i></a>
    
              <a href="${data[i].slug}/">
                <img src="${ data[i].main_image }" title="${ data[i].title }" alt="${ data[i].title }" style="height: 500px;">
              </a>
    
              <div class="caption">
                <h1 class="h3">${ data[i].title }</h1>
                <label> ${ data[i].created_at }</label>
                <hr class="offset-sm">
    
                <p>
                ${ data[i].description.slice(0, 340) } ...
                 
                </p>
                <hr class="offset-sm">
    
                <a href="${ data[i].slug }/"> View article <i class="ion-ios-arrow-right"></i> </a>
              </div>
            </div>
            </div>
            `
        }


        $("#blogFilter").html(htmlString)
    })
}  