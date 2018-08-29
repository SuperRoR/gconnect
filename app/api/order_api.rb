class OrderAPI < Grape::API

  prefix 'order'

  desc 'Get Order List'

  get :get_order_list do
    if params[:hotel_name].blank? || params[:code].blank? || current_room.blank?
      {
          status: "ERROR: AUTHENTICATION"
      }
    else
      {
          status: "OK",
          result: current_room.current_orders.as_json(include: { order_details: { include: :product }})
      }
    end
  end

  desc 'Creat an order'

  post :create_order do
    if params[:hotel_name].blank? || params[:code].blank? || current_room.blank?
      {
          status: "ERROR: AUTHENTICATION"
      }
    else
      if params[:order_details]
        order = current_room.orders.create!
        order.order_details.create!(params[:order_details])
        {
            status: "OK",
            result: order.as_json(include: :order_details)
        }
      else
        {
          status: "OK"
        }
      end
    end
  end
end