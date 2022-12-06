//Slider price
$('.filter a[data-action="clear-price"]').on('click', function(){

    $( ".filter #slider-price" ).slider({ values: [ 1, 10000 ] });

    $( ".filter #amount" ).html( $( ".filter #slider-price" ).slider( "values", 0 )  + " $ - " + 
      $( ".filter #slider-price" ).slider( "values", 1 ) + " $" );
});

if( $( "body" ).find('.filter').length > 0 ){
    // console.log($('#max-price').text());
    let maxi = Math.round(parseFloat($('#max-price').text()) / 1000) * 1000 ;
    $( ".filter #slider-price" ).slider({
      range: true,
      min: 1,
      max: maxi,
      values: [ 1, maxi ],
      slide: function( event, ui ) {
        $( "#amount" ).html( ui.values[ 0 ] + " $ - " + ui.values[ 1 ] + " $" );
      }
    });
    

    $( ".filter #amount" ).html( $( "#slider-price" ).slider( "values", 0 )  + " $ - " + 
      $( "#slider-price" ).slider( "values", 1 ) + " $" );
}
//Slider price