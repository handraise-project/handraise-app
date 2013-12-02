# # Place all the behaviors and hooks related to the matching controller here.
# # All this logic will automatically be available in application.js.
# # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $("#add_response .reply-submit").attr "disabled", "disabled"

  $("#add_response .reply-description").keyup ->  
    if $("#add_response .reply-description").val().length > 0
      $( "#add_response .reply-submit" ).removeAttr "disabled"
    else
      $("#add_response .reply-submit").attr "disabled", "disabled"
