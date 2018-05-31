class ProductAPI < Grape::API

  prefix 'product'

  desc 'Get Product List'

  get :get_product_list do

    if params[:hotel_name].blank? || params[:code].blank? || current_room.blank?
      {
          status: "ERROR: AUTHENTICATION"
      }
    else
      {
          status: "OK",
          result: current_hotel.departments.as_json(include: :products)
      }

    end

  end



end