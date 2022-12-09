    $(document).on('submit', '#subscribe', function(e) {
        e.preventDefault();

        var mail = $("input[name='email']").val();
        console.log(mail);
        var csrf_token = $("input[name='csrfmiddlewaretoken']").val();

        $.ajax({
            type: "POST",
            // url: "{% url 'core:subscribe' %}",
            url: "/subscribe/",
            data: {
                "email": mail,
                "csrfmiddlewaretoken": csrf_token
            },
           
            dataType: 'json',
            success: function (response) {
                $("#subscribe").trigger('reset');
                $("#message").html(response.message)
           
            },
       
        });
    });

