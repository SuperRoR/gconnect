class ProductAPI < Grape::API

  prefix 'product'

  desc 'Get Product List'

  get :get_product_list do

    if params[:auth].blank? || current_user.blank?
      {
          status: "ERROR: AUTHENTICATION"
      }
    else
      {
          status: "OK",
          result: Product.all.as_json
      }

    end

  end



end