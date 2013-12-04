    $(function() {
      $('input[type=button], .draggable').draggable({cancel:false});
      $( "#droppable" ).droppable({
        accept: ".draggable, .ui, .issue-title, .meta-info",
        drop: function( event, ui ) {
          $( this )
          $.ajax("/course/:course_id/issues/:issue_id/queue_item")
          console.log(ui.draggable).attr('id');

        }
      });
    });
