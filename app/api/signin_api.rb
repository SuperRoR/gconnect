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
      if room.status == :checkin
        if room.sign_in(params[:phone_type], params[:device_token1], params[:device_token2])
          {
              status: "OK",
              from: room.from.to_s,
              days: room.days.to_s,
              sip_setting: {
                  ext_no: room.ext_no.to_s,
                  ext_password: room.ext_password.to_s,
                  wevo_pbx_domain: current_hotel.wevo_pbx_domain.to_s,
                  manager_ext_no: current_hotel.manager_ext_no,
                  site_url: current_hotel.site_url,
                  message_icon_url: current_hotel.message_icon.url,
                  hotel_slug: current_hotel.slug

              }
          }
        else
          {
              status: "ERROR: Wrong Hotel_Name or Room Code"
          }
        end
      else
        {
              status: "ERROR: Not Checkin Status"
        }
      end
    end

  end


end