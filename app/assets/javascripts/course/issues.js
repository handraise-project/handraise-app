$(function() {
      $('input[type=button], .draggable').draggable({
        cancel: false, //allows button tags to be dragged
        revert: "invalid" //reverts invalid drops to initial position.

      });
      $( "#droppable" ).droppable({
        accept: ".draggable, .ui, .issue-title, .meta-info",
        drop: function( event, ui ) {
          var self = ui.draggable;
          var destination = ui.draggable.parent().attr('href');
          var finaldest = destination + "/queue";
          $.post(finaldest, function(data) {
            refreshFunction(self);
          });
      }
    });
     function refreshFunction(self){
     var url = window.location.href;
     var going = url + "/refresh";
        $.post(going, function(data) {
          //beginning of instructor queue
            $(self).remove();
            $("#instructor_refresh").empty();
            // $(self).remove();
            $("#open_issue_refresh").empty();
            // $(self).remove();
            $("#resolved_issue_refresh").empty();
            $.each(data, function(i, issue){
              if(issue.instructor_id > 0 && issue.resolved === 0) {
                var queue_content =  '<li class="draggable ui ui-draggable" >'+
                             '<a href="/courses/'+issue.course_id+'/issues/'+issue.id+'">'+
                             '<button class="draggable ui ui-draggable ui-draggable-dragging">'+
                             '<span class="issue-title">'+issue.title+'</span>'+
                             '<ul class="meta-info">'+ 
                             '<li>'+issue.user.name+',' + issue.time_as_words + '</li>'+
                             '</ul>'+
                             '</button>'+
                             '</a></li>';
                $("#instructor_refresh").append(queue_content);
            };
            if (issue.instructor_id === null && issue.resolved === 0) {
              $('input[type=button], .draggable').draggable({
                  cancel: false, //allows button tags to be dragged
                  revert: "invalid" //reverts invalid drops to initial position.
              });

              var open_issues = '<li class="draggable ui">'+
                             '<a href="/courses/'+issue.course_id+'/issues/'+issue.id+'">'+
                             '<button class="draggable ui">'+
                             '<span class="issue-title">'+issue.title+'</span>'+
                             '<ul class="meta-info">'+ 
                             '<li>'+issue.user.name+',' + issue.time_as_words + '</li>'+
                             '</ul>'+
                             '</button>'+
                             '</a></li>';
                $("#open_issue_refresh").append(open_issues);
            }
            if (issue.resolved > 0) {
              var closed_issues = '<a href="/courses/'+issue.course_id+'/issues/'+issue.id+'">'+
                                  '<li>'+issue.user.name+':'+issue.title+' ('+' responses)</li></a>';
                $("#resolved_issue_refresh").append(closed_issues);
            }

          });
            //end of instructor queue

        }
      );
     };
    
    //There needs to be an if statement so that this only happens on the courses show page.
    setInterval(refreshFunction, 30000);

  });
