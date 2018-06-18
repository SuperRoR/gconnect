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
    elsif params[:phone_type].blank?
      {
          status: "ERROR: Phone Type"
      }
    elsif params[:device_token1].blank?
      {
          status: "ERROR: Device Token"
      }
    else
      room = current_room
      if room.sign_in(params[:phone_type], params[:device_token1], params[:device_token2])
        {
            status: "OK",
            from: room.from,
            days: room.days,
            sip_setting: {
                ext_no: room.ext_no,
                ext_password: room.ext_password,
                wevo_pbx_domain: current_hotel.wevo_pbx_domain,
            }
        }
      else
        {
            status: "ERROR: Wrong Hotel_Name or Room Code"
        }
      end
    end

  end


end