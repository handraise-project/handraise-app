# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  if $(".course-name").val().length == 0
    $(".course-submit").attr "disabled", "disabled"

  $(".course-name").keyup ->  
    if $(".course-name").val().length > 0
      $( ".course-submit" ).removeAttr "disabled"
    else
      $(".course-submit").attr "disabled", "disabled"