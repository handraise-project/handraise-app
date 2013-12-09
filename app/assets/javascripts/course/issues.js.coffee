# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  if $("#issue-submit-new").length and $("#issue-title-new").length
    $("#issue-submit-new").attr "disabled", "disabled"


    $("#issue-title-new").keyup ->  
      if $("#issue-title-new").val().length > 0
        $("#issue-submit-new").removeAttr "disabled"
      else
        $("#issue-submit-new").attr "disabled", "disabled"


$(document).ready ->
  if $("#issue-submit").length and $("#issue-title").length
    $("#issue-title").keyup ->  
      if $("#issue-title").val().length > 0
        $("#issue-submit").removeAttr "disabled"
      else
        $("#issue-submit").attr "disabled", "disabled"




