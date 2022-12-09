$("#register-message").hide();
$(document).on('submit',  function(e) {
    e.preventDefault();

    var csrf_token = $("input[name='csrfmiddlewaretoken']").val();
    data = {
        
		"first_name": $("input[name='first_name']").val(),
		"last_name": $("input[name='last_name']").val(),
		"username": $("input[name='username']").val(),
		"email": $("input[name='email']").val(),
		"password1": $("input[name='password1']").val(),
		"password2": $("input[name='password2']").val(),
        "csrfmiddlewaretoken": csrf_token
    }
    console.log(data);

    $.ajax({
        type: "POST",
        url: "http://127.0.0.1:8000/users/register/",
        data: data,
       
        dataType: 'json',
        success: function (response) {
            console.log(response);
            $("#register-message").show();
            $("#register-message").html(response.message);
       
        },
   
    });
   
});

