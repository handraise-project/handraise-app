    $(function() {
      $('input[type=button], .draggable').draggable({
        cancel:false,
        //snap: '#droppable'

      });
      $( "#droppable" ).droppable({
        accept: ".draggable, .ui, .issue-title, .meta-info",
        drop: function( event, ui ) {
          var destination = ui.draggable.parent().attr('href');
          var finaldest = destination + "/queue";
          $.post(finaldest, function(data) {
            //window.location.reload();
            console.log("hello!");
          });
      }
    });
    });