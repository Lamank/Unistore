

  $('.comment-reply-btn').click(function (event) {

    event.preventDefault();
    $(this).parent().parent().next(".comment-reply").fadeToggle();
    var childForm = $(this).parent().parent().next(".comment-reply").find('form')
    var childComment = $(this).parent().parent().next(".comment-reply").find('.childComment');
    var count = parseInt($(this).prev('span').text());
    var commentCount = $(this).prev('span');
    // $(childForm).on('submit',function(e){
    //     e.preventDefault();
    //     console.log("ITEM");
    //     $.ajax({
    //         type: $(this).attr('method'),
    //         url: $(this).attr('action'),
    //         data: $(this).serialize(),
    
    //         success:function(response){
    //             // console.log(response.new_comment);
    //             console.log('this is child comment', childComment[0]);
    //             $(this).trigger("reset");
    //             // console.log();
    //             childComment.first()[.prepend(`
    //             <blockquote class="childComment" style="margin-bottom: 10px;">
    //             <div style="font-size: 17px; margin: 5px 0;">
    //               <div >
    //                 <label style="font-size: 18px;"> ${response.new_comment.username} </label>
    //                 <span style="margin: 0 10px">|</span>
    //                 <span style="color: rgb(80, 80, 80);"> ${response.new_comment.timestamp} ago</span>
    //               </div>
    //               <p>
    //                 ${response.new_comment.body} 
    //               </p>
                
    //             </div>
    //             </blockquote>
    //             `)
    //             count++;
    //             commentCount.html(count);
    //             }
    //       })
    //   });  
  });

  
  $('#comment_btn').click(function() {
    $('#comment_btn').hide();
    $('#info-register').show();
  });

 





