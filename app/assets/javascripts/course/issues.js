    $(function() {
      $('input[type=button], .draggable').draggable({
        cancel: false, //allows button tags to be dragged
        revert: "invalid" //reverts invalid drops to initial position.
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
     function refreshFunction(){
     var url = window.location.href;
     var going = url + "/refresh";
        $.post(going, function(data) {
          //beginning of instructor queue
           $("#instructor_refresh").empty();
            $(self).remove();
            $.each(data, function(i, issue){
              console.log(issue.resolved)
              console.log(issue.instructor_id)
              if(issue.instructor_id > 0 && issue.resolved === 0) {
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
            };
          });
            //end of instructor queue
        }
      );
     };
    
    // do i even need this? refreshFunction();
    //There needs to be an if statement so that this only happens on the courses show page.
    setInterval(refreshFunction, 30000);

  });