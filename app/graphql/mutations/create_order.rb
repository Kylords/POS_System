class Mutations::CreateOrder < Mutations::BaseMutation
  argument :order_type, String, required: true

  argument :province, String, required: true
  argument :city, String, required: true
  argument :baranggay, String, required: true
  argument :street, String, required: true

  argument :room_unit, String, required: false
  argument :floor, String, required: false
  argument :building, String, required: false
  argument :remarks, String, required: false
  argument :nearest_landmark, String, required: false
  
  argument :delivery_id, Integer, required: true
  argument :payment_id, Integer, required: true

  argument :first_name, String, required: true
  argument :last_name, String, required: true
  argument :email, String, required: true
  argument :mobile, String, required: true
  

  field :order, Types::OrderType, null: false
  field :errors, [String], null: false


  def resolve(order_type: nil, province: nil, city: nil, baranggay: nil, street: nil, room_unit: nil, floor: nil, building: nil, nearest_landmark: nil, remarks: nil, delivery_id: nil, payment_id: nil, first_name: nil, last_name: nil, email: nil, mobile: nil)
      user = context[:current_user]
      user_id = user.id
      product_ids = user.cart.cart_items.pluck(:product_id)
      quantities = user.cart.cart_items.pluck(:quantity)



      


      puts 123

      status = "Pending"
      province = '' if order_type == 'In-Store'
      city = '' if order_type == 'In-Store'
      baranggay = '' if order_type == 'In-Store'
      street = '' if order_type == 'In-Store'
      room_unit = '' if order_type == 'In-Store'
      floor = '' if order_type == 'In-Store'
      building = '' if order_type == 'In-Store'
      remarks = '' if order_type == 'In-Store'
      nearest_landmark = '' if order_type == 'In-Store'

      total_price = user.cart.cart_items.sum { |item| item.total_price.to_f } + Delivery.find(delivery_id).price.to_i + 50
      
      order = Order.new(
          order_type: order_type,
          user_id: user_id,
          product_ids: product_ids,
          status: status,
          total_price: total_price,
          delivery_id: delivery_id,
          payment_id: payment_id,
          
          province: province,
          city: city,
          baranggay: baranggay,
          street: street,
          room_unit: room_unit,
          floor: floor,
          building: building,
          remarks: remarks,
          nearest_landmark: nearest_landmark,

          first_name: first_name,
          last_name: last_name,
          email: email,
          mobile: mobile

    )



    
    if order.save
      user.cart.cart_items.each do |item|
        order.product_quantities.create(product_id: item.product_id, quantity: item.quantity)
      end
      user.cart.cart_items.destroy_all
      OrderMailer.order_mailer(order.id).deliver_later
      { order: order, errors: [] }
    else
      { order: nil, errors: order.errors.full_messages }
    end
  end

end