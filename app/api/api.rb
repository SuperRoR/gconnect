
class API < Grape::API
  PREFIX = '/api'

  format :json
  default_format :json

  before do
    header 'Access-Control-Allow-Origin', '*'
  end

  helpers do
    def current_user
      WevoUser.where(auth_token: params[:auth]).first
    end
  end


  mount SigninAPI
  mount ProductAPI
  mount OrderAPI

end

Grape::CORS.apply!
