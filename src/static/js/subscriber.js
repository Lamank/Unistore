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
            // error: function (response) {
            //     alert("zsxdcfvgbhnj");
            // }
        });
    });

// $("#subscribe").on('submit', (function (e) {
//     e.preventDefault();
//     console.log("sdfsfs")
//     // var serializedData = $(this).serialize();

//     // $.ajax({
//     //     type: "POST",
//     //     url: "{% url 'core:subscribe' %}",
//     //     data: serializedData,
//     //     dataType: 'json',
//     //     success: function (response) {
//     //         console.log(response)
//     //         $("#subscribe").trigger('reset');
//     //         $("#message").html(response.message)
//     //         // $("#subscribe tbody").prepend(
//     //         //     `<tr>
//     //         //         <td>${fields["email"]||""}</td>
//     //         //     </tr>`
//     //         // )
//     //     },
//     //     error: function (response) {
//     //         alert(response["responseJSON"]["error"]);
//     //     }
//     // }).done(function () {
//     //     //trigger any doc ready scripts we may have just loaded
//     //     jQuery.ready();
//     // });

// }));

// // document.querySelector("#subscribe").addEventListener("submit", function(e) {
// //     console.log("dsfsdf")
// //     fetch("http://127.0.0.1:8000/subscribe", {
// //         method: "POST",
// //         "Content-Type": "application/json",
// //         body: JSON.stringify(e)
// //     })
// //       .then((response) => {
// //           return response.json()
// //       })
// //       .then((data) => {
// //           console.log(data)
// //       })
// // })
