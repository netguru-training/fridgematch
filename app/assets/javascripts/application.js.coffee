#= require jquery
#= require jquery_ujs
#= require jquery.ui.all
#= require autocomplete-rails
#= require jquery.circliful.min
#= require turbolinks
#= require bootstrap
#= require_tree .
#= require dataTables/jquery.dataTables
#= require dataTables/jquery.dataTables.bootstrap3

ready = ->
  $('.percentageCircle').circliful()
  $('.datatable').dataTable
    "sPaginationType": "bootstrap",
    "aoColumns": [
                null,
                { "bSortable": false },
                null,
                { "bSortable": false },
                { "bSortable": false },
                null,
            ]
$(document).ready(ready)
$(document).on('page:load', ready)
