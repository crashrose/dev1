#= require active_admin/base
#= require activeadmin-sortable

#= require bootstrap


jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()