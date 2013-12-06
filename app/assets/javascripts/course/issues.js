    $(function() {
      $('input[type=button], .draggable').draggable({
        cancel:false
        // revert: true,
        //snap: '#droppable'

      });
      $( "#droppable" ).droppable({
        accept: ".draggable, .ui, .issue-title, .meta-info",
        drop: function( event, ui ) {
          var self = ui.draggable;
          var destination = ui.draggable.parent().attr('href');
          var finaldest = destination + "/queue";
          $.post(finaldest, function(data) {
            //window.location.reload();
            //console.log(data);
            $("#instructor_refresh").empty();
            $(self).remove();
            $.each(data, function(i, issue){
              var content =  '<li class="draggable ui ui-draggable">'+
                             '<a href="/courses/'+issue.course_id+'/issues/'+issue.id+'">'+
                             '<button class="draggable ui ui-draggable ui-draggable-dragging">'+
                             '<span class="issue-title">'+issue.title+'</span>'+
                             '<ul class="meta-info">'+ 
                             '<li>'+issue.user.name+',' + issue.time_as_words + '</li>'+
                             '</ul>'+
                             '</button>'+
                             '</a></li>';
              $("#instructor_refresh").append(content);
            });
          });
      }
    });
    });