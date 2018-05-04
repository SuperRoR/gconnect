class SigninAPI < Grape::API

  prefix 'signin'

  desc 'Signin API'

  get :signin do
    if params[:initcode].blank?
      {
          status: "ERROR: INITIALIZATION CODE"
      }
    elsif params[:auth].blank?
      {
          status: "ERROR: AUTHENTICATION"
      }
    else
      user = current_user
      if user
        {
            status: "OK",
            auth_token: user.auth_token,
            sip_setting_url: ENV["ASSET_HOST"]+"/api/signin/get_sipsetting",
            phonebook_url: "http://113.23.226.22:1443/api/signin/get_phonebook.php",
            update_url: "http://113.23.226.22:1443/api/signin/get_update.php"
        }
      else
        {
            status: "ERROR: AUTHENTICATION"
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