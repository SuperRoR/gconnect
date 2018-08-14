require "erb"
include ERB::Util

ActiveAdmin.register Room do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  scope_to proc{ current_admin_user}

  permit_params do
    params = []
    params.push [ :room_number, :sub_number, :status, :from, :days, :code, :ext_no1, :ext_password1, :ext_no2, :ext_password2] unless current_admin_user.department_manager?
    params.push :hotel_id if current_admin_user.super_admin?
    params
  end
  index do
    selectable_column
    id_column
    column :hotel
    column :room_number
    column :sub_number
    if current_admin_user.department_manager?
      column :status
      column :from
      column :days
    else
      column :status do |room|
        link_to room.next_status, checkin_out_admin_room_path(room), class: "status-btn"
      end
      column :from do |room|
        best_in_place room, :from, as: :date, url: [:admin,room]
      end
      column :days do |room|
        best_in_place room, :days, as: :input, url: [:admin,room]
      end

    end
    column :code
    column :ext_no1
    column :ext_password1
    column :ext_no2
    column :ext_password2
    actions do |room|
      item "QR Code", qr_code_generate_admin_room_path(u(api_url+room.generate_qr_code_url)), class: "member_link qrcode_link", download: "QRcode_for_#{room.room_number}.png", target: "_blank" unless current_admin_user.department_manager?
    end
  end
  form do |f|
    f.inputs do
      f.input :hotel, :as => :select, :collection => current_admin_user.hotels, :input_html => { :disabled => !current_admin_user.super_admin? }

      f.input :room_number
      f.input :sub_number
      f.input :status, :as => :select, :collection => enum_option_pairs(Room,  Room.statuses), include_blank: false
      f.input :from
      f.input :days
      f.input :ext_no1
      f.input :ext_password1
      f.input :ext_no2
      f.input :ext_password2
    end
    f.actions
  end
  member_action :checkin_out, method: :get do
    if resource.next_status == :checkout
      resource.checkout
    else
      flash[:warning] = "<From> and <Days> Fields are required! " if !resource.from || resource.days < 1
      resource.checkin
    end
    redirect_to admin_rooms_path
  end

  member_action :qr_code_generate, method: :get do
    qrcode = RQRCode::QRCode.new(params[:id])
    png = qrcode.as_png(size: 240, border_modules: 1)
    # byebug
    # IO.write("/tmp/qrcode_#{srand}.png", png.to_s)
    send_data png
  end

  controller do
    def action_methods
      if current_admin_user.super_admin? ||  current_admin_user.hotel_admin?
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
