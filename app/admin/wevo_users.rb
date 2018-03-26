ActiveAdmin.register WevoUser do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :wevo_server_id, :email, :user_display_name, :phone_number, :is_verified, :extension, :auth_token, :wevopbx_domain, :wevopbx_local_domain, :remember_token, :role_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
