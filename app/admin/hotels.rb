ActiveAdmin.register Hotel do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  scope_to proc{ current_admin_user}, association_method: :hotels, unless: proc{ current_admin_user.is_super_admin? }

  actions :all
  permit_params :name, :description, :wevo_pbx_local_domain, :wevo_pbx_remote_domain
  controller do
    def action_methods
      if current_admin_user.is_super_admin?
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
