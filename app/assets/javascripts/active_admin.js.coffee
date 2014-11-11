# Remove active_admin/base which includes all js files and select js to include manually
#  dont require active_admin/base


#= require jquery
#  dont require jquery-ui/datepicker
#= require jquery-ui/dialog
#= require jquery-ui/sortable
#= require jquery-ui/widget
#= require jquery_ujs
#= require_self
#= require active_admin/lib/batch_actions
#= require active_admin/lib/checkbox-toggler
#= require active_admin/lib/dropdown-menu
#= require active_admin/lib/flash
#= require active_admin/lib/has_many
#= require active_admin/lib/modal_dialog
#= require active_admin/lib/popover
#= require active_admin/lib/table-checkbox-toggler
#= require active_admin/ext/jquery-ui
#= require active_admin/ext/jquery
#  dont require active_admin/application -- replaced with aa_monkey_patch which excludes jQuery UI datepicker code
#= require aa_monkey_patch


#= require jquery_nested_form

#= require activeadmin-sortable

#= require bootstrap

#= require select2


#= require aa_custom

#= require jquery_nested_form


#= require bootstrap-toggle.min

#= require moment
#= require bootstrap-datetimepicker
#= require pickers


#= require cocoon

window.ActiveAdmin = {}
window.AA = window.ActiveAdmin unless window.AA