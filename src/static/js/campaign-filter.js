import { _filterObj, fetch_function } from "./product-filter.js";

$('.campaign').on('click',  function(){
    console.log( $(this).data("value"));
    _filterObj.campaign = $(this).data("value");
  
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
