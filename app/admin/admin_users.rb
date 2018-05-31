ActiveAdmin.register AdminUser do
  scope_to proc{ current_admin_user.hotel},  unless: proc{ current_admin_user.is_super_admin? }

  actions :all
  permit_params :email, :password, :password_confirmation, :hotel_id, :is_super_admin

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :hotel
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :hotel if current_admin_user.is_super_admin?
      f.input :is_super_admin if current_admin_user.is_super_admin?
    end
    f.actions
  end

  controller do
    def action_methods
      if current_admin_user&.is_super_admin?
        super
      else
        super - ['destroy', 'new']
      end
    end
  end

end
