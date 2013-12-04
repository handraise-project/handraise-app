# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

(($) ->
  $.fn.extend limiter: (limit, elem) ->
    setCount = (src, elem) ->
      chars = src.value.length
      if chars > limit
        src.value = src.value.substr(0, limit)
        chars = limit
      elem.html limit - chars
    $(this).on "keyup focus", ->
      setCount this, elem

    setCount $(this)[0], elem

) jQuery

# Type here! 
Scope::find = (name, options) ->
  return true  if @check(name, options)
  @add name, "var"
  false

  elem = $("#chars")
2
$("#add_course").limiter 30 , elem





$(document).ready ->
  if $(".course-name").val().length == 0
    $(".course-submit").attr "disabled", "disabled"

  $(".course-name").keyup ->  
    if $(".course-name").val().length > 0
      $( ".course-submit" ).removeAttr "disabled"
    else
      $(".course-submit").attr "disabled", "disabled"


