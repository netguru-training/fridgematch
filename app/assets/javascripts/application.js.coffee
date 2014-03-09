#= require jquery
#= require jquery_ujs
#= require jquery.ui.all
#= require autocomplete-rails
#= require jquery.circliful.min
#= require turbolinks
#= require bootstrap
#= require_tree .


ready = ->
  $('.percentageCircle').circliful()

$(document).ready(ready)
$(document).on('page:load', ready)
