# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  if $("#reply-submit").length and $("#reply-description").length
    $("#reply-submit").attr "disabled", "disabled"  

    $("#reply-description").keyup ->  
      if $("#reply-description").val().length > 0
        $( "#reply-submit" ).removeAttr "disabled"
      else
        $("#reply-submit").attr "disabled", "disabled"
