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
            sip_setting: {
                ext_no: room.ext_no,
                ext_password: room.ext_password,
                wevo_pbx_local_domain: current_hotel.wevo_pbx_local_domain,
                wevo_pbx_remote_domain: current_hotel.wevo_pbx_remote_domain
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