class SigninAPI < Grape::API

  prefix 'signin'

  desc 'Signin API'

  get :signin do
    if params[:hotel_name].blank?
      {
          status: "ERROR: Hotel Name"
      }
    elsif params[:code].blank?
      {
          status: "ERROR: Room Code"
      }
    else
      room = current_room
      if room.check_in
        {
            status: "OK",
            from: room.from,
            days: room.days,
            sip_setting: {}
        }
      else
        {
            status: "ERROR: Wrong Hotel_Name or Room Code"
        }
      end
    end

  end


  desc 'Get SIP Settings'

  post "get_sipsetting" do

    if params[:initcode].blank?
      {
          status: "ERROR: INITIALIZATION CODE",
          data: "INITIALIZATION code is not found"
      }
    elsif params[:auth].blank?
      {
          status: "ERROR: AUTHENTICATION",
          data: "Authentication code is invalid"
      }
    elsif params[:os].blank?
      {
          status: "ERROR: OS",
          data: "OS is not found"
      }
    elsif params[:osversion].blank?
      {
          status: "ERROR: OS Version",
          data: "OS Version is not found"
      }
    elsif params[:device_token].blank?
      {
          status: "ERROR: Device Token",
          data: "Device Token is not found"
      }
    else
      user = current_user
      if user
        user.wevo_device.device_type = params[:os]
        user.wevo_device.device_token = params[:device_token]
        user.save

        result = user.as_json(include: :wevo_device)
        result[:status] = "OK"
        result[:admin_extension] = WevoUser.admin_extension
        result[:is_admin] = user.is_admin?
        result
      else
        {
          status: "ERROR: AUTHENTICATION",
          data: "Authentication code is invalid"
        }
      end

    end

  end


end