
class API < Grape::API
  PREFIX = '/api'

  format :json
  default_format :json

  before do
    header 'Access-Control-Allow-Origin', '*'
  end

  helpers do
    def current_room
      Hotel.friendly.find(params[:hotel_name]).rooms.where(code: params[:code]).first rescue nil
    end
    def current_hotel
      Hotel.friendly.find(params[:hotel_name])
    end
  end


  mount SigninAPI
  mount ProductAPI
  mount OrderAPI
  mount RoomConfigurationAPI

end

Grape::CORS.apply!
