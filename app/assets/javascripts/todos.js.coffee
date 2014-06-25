# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(".todo-check").on "change", ->
  $.ajax
    url: "/todos/" + @value + "/toggle"
    type: "POST"
    data:
      complete: @checked
    success: (data) ->
      id = "#todo_" + data.id
      complete = data.complete
      parent = $("#todos-list")
      if complete
        $(id).detach().appendTo(parent)
      else
        $(id).detach().prependTo(parent)
