ActiveAdmin.register OrderDetail do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  scope_to proc{ current_admin_user}

  permit_params do
    params = []
    params.push [:order_id, :product_id, :amount] unless current_admin_user.department_manager?
    params
  end
  index do
    selectable_column
    id_column
    column :room
    column :order
    column :product
    column :amount
    actions
  end
  form do |f|
    f.inputs do
      f.input :order, :as => :select, :collection => Hash[current_admin_user.orders.map{|d| ["Order # #{d.id} (#{d.hotel.name}: #{d.room.room_number})", d.id]}], :input_html => { :disabled => current_admin_user.department_manager? }
      f.input :product, :as => :select, :collection => Hash[current_admin_user.products.map{|d| ["#{d.hotel.name}:#{d.department.name} # #{d.name}", d.id]}], :input_html => { :disabled => current_admin_user.department_manager? }
      f.input :amount
    end
    f.actions
  end


  controller do
    def action_methods
      unless current_admin_user.department_manager?
        super
      else
        super - ['destroy', 'new', 'edit']
      end
    end

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
