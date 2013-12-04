# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $("#issue-submit").length
  $("#issue-submit").attr "disabled", "disabled"

  $("#issue-title").keyup ->  
    if $("#issue-title").val().length > 0
      $( "#issue-submit" ).removeAttr "disabled"
    else
      $("#issue-submit").attr "disabled", "disabled"


