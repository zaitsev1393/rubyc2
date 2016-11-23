$ ->
  $("#hidebutton").click ->
    $("#logger").animate 
      'opacity': 0

  $("#showbutton").click ->
    $("#logger").animate 
      'opacity': 1