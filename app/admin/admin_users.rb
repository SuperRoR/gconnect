ActiveAdmin.register AdminUser do
  scope_to proc{ current_admin_user}
  actions :all
  permit_params :email, :password, :password_confirmation, :hotel_id, :department_id, :is_super_admin, :role

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :hotel
    column :department
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
      f.input :hotel if current_admin_user.super_admin?
      f.input :department, :as => :select, :collection => current_admin_user.departments unless current_admin_user.department_manager?
      f.input :role, :as => :select, :collection => current_admin_user.super_admin? ? enum_option_pairs(AdminUser,  AdminUser.roles) : {"department_manager"=>"department_manager"}, include_blank: false
    end
    f.actions
  end

  controller do
    def action_methods
      unless current_admin_user.department_manager?
        super
      else
        super - ['destroy', 'new']
      end
    end

  end

end
