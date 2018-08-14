#= require arctic_admin/base
#= require best_in_place
#= require jquery.purr
#= require best_in_place.purr
#= require jquery-ui
#= require best_in_place.jquery-ui

$(document).ready ->
  jQuery(".best_in_place").best_in_place()

  $.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd'
  });

  change_to_icon('.view_link', 'eye')
  change_to_icon('.delete_link', 'trash')
  change_to_icon('.edit_link', 'pencil')
  change_to_icon('.qrcode_link', 'qrcode')


# klass is class of group, icon_klass is icon name from font awesome
change_to_icon = (klass, icon_name) ->
  buttons = $(klass)
  $.each buttons, (_, button) ->
    button.text = ''
    $(button).addClass(klass+'_image fa fa-'+icon_name)

