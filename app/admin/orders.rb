ActiveAdmin.register Order do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  scope_to proc{ current_admin_user}

  permit_params do
    params = []
    params.push [:status, :room_id] unless current_admin_user.department_manager?
    params.push [:status] if current_admin_user.department_manager?
    params
  end
  index do
    selectable_column
    id_column
    column :hotel
    column :room
    column :status
    column :created_at
    column :updated_at
    actions
  end
  form do |f|
    f.inputs do
      f.input :room, :as => :select, :collection => Hash[current_admin_user.rooms.map{|d| ["<#{d.hotel.name}>: #{d.room_number}", d.id]}], :input_html => { :disabled => current_admin_user.department_manager? }
      f.input :status, :as => :select, :collection => enum_option_pairs(Order, Order.statuses), :input_html => { :disabled => current_admin_user.department_manager? }
    end
    f.actions
  end
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
