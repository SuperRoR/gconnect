ActiveAdmin.register Hotel do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  scope_to proc{ current_admin_user}

  actions :all
  permit_params :name, :description, :wevo_pbx_local_domain, :wevo_pbx_remote_domain, :manager_ext_no, :site_url, :message_icon, :use_cloud
  index do
    selectable_column
    id_column
    column :name
    column :description
    column :slug
    column :wevo_pbx_local_domain
    column :wevo_pbx_remote_domain
    column :icon do |i|
      div do
        span class:"icon-image" do
          image_tag(i.message_icon.url) unless i.message_icon.blank?
        end
      end
    end
    column :manager_ext_no
    column :site_url
    column :use_cloud
    column :created_at
    column :updated_at
    actions
  end
  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :wevo_pbx_local_domain
      f.input :wevo_pbx_remote_domain
      f.input :manager_ext_no
      f.input :site_url
      f.input :message_icon
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
