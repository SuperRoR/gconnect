ActiveAdmin.register Department do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  scope_to proc{ current_admin_user}

  permit_params do
    params = [:name]
    params.push :hotel_id if current_admin_user.super_admin?
    params
  end
  form do |f|
    f.inputs do
      f.input :hotel, :input_html => { :disabled => !current_admin_user.super_admin? }
      f.input :name
    end
    f.actions
  end

  controller do
    def action_methods
      if current_admin_user.super_admin?
        super
      elsif current_admin_user.hotel_admin?
        super
      else
        super - ['destroy', 'new']
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
