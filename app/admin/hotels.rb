ActiveAdmin.register Hotel do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  scope_to proc{ current_admin_user}

  actions :all
  permit_params :name, :description, :wevo_pbx_local_domain, :wevo_pbx_remote_domain, :use_cloud
  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :wevo_pbx_local_domain
      f.input :wevo_pbx_remote_domain
      f.input :use_cloud unless current_admin_user.department_manager?
    end
    f.actions
  end
  controller do
    def action_methods
      if current_admin_user.super_admin?
        super
      elsif current_admin_user.hotel_admin?
        super - ['destroy', 'new']
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
