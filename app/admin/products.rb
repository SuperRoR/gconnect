ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  scope_to proc{ current_admin_user}

  permit_params do
    params = [:name, :price, :amount, :icon]
    params.push :department_id unless current_admin_user.department_manager?
    params
  end
  index do
    selectable_column
    id_column
    column :name
    column :price
    column :amount
    column :icon do |i|
      div do
        span class:"icon-image" do
          image_tag(i.icon.url) unless i.icon.blank?
        end
      end
    end
    column :department
    column :hotel
    actions
  end
  form do |f|
    f.inputs do
      f.input :department, :as => :select, :collection => Hash[current_admin_user.departments.map{|d| ["<#{d.hotel.name}>: #{d.name}", d.id]}], :input_html => { :disabled => current_admin_user.department_manager? }

      f.input :name
      f.input :price
      f.input :amount
      f.input :icon
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
