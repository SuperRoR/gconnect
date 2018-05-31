ActiveAdmin.register Room do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  scope_to proc{ current_admin_user.hotel},  unless: proc{ current_admin_user.is_super_admin? }

  permit_params :hotel_id, :room_number, :sub_number, :status, :from, :days, :code, :ext_no, :ext_password
  index do
    selectable_column
    id_column
    column :hotel
    column :room_number
    column :sub_number
    column :status
    column :from
    column :days
    column :code
    column :ext_no
    column :ext_password
    actions do |room|
      item "QR Code", "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=#{api_url+room.generate_qr_code_url}", class: "member_link", download: "QRcode_for_#{room.room_number}", target: "_blank"
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
