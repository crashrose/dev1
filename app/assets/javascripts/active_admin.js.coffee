#= require active_admin/base
#= require activeadmin-sortable

#= require bootstrap

#= require select2


jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()