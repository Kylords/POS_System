class Mutations::ChangeOrderStatus< Mutations::BaseMutation
    argument :status, String, required: true
    argument :order_id, Integer, required: true
    


    field :order, Types::OrderType, null: false
    field :errors, [String], null: false


    def resolve(status: nil, order_id: nil)
        order = Order.find(order_id)
        order.status = status


        if order.save
          
          { order: order, errors: [] }
        else
          { order: nil, errors: order.errors.full_messages }
        end
    end
end

