class RoomConfigurationAPI < Grape::API

  prefix 'room'

  desc 'Get Room Status API'

  get :status do
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
      if room
        {
            status: "OK",
            checkin_status: room.status,
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
            status: "ERROR: Incorrect Information"
        }
      end
    end

  end


end