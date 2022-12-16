$("#register-message").hide();
$("#registerForm").on('submit',  function(e) {
 
  console.log($(this).serialize());
    e.preventDefault();
    $.ajax({
        type: $(this).attr('method'),
        url: $(this).attr('action'),
        data: $(this).serialize(),
        dataType: 'json',
        success: function (response) {
            if(response['success']) {
                $("#register-message").show();
                $('#registerForm').trigger("reset");
                $("#register-message").html(`<div class='alert alert-success'>${response['message']}</div>`);
            } 
            if(response['errors']) {
                $('input').next('ul').html(" ");
                console.log(response.data);
                for(error_key in response['errors']){
                    if(error_key === $(`input[name=${error_key}]`).attr('name')){
                        $(`input[name=${error_key}]`).next('ul').html(" ");
                        for(error in response['errors'][error_key]){
                            $(`input[name=${error_key}]`).next().append(
                                "<li class='text-danger'>" + response['errors'][error_key][error] +"</li>"
                            );
                        }
                    }
                }
            }},

        error: function (request, status, error) {
            console.log('error function',request.responseText);
       }
   
    });
   
});

