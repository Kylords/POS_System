class Mutations::DeleteOrder < Mutations::BaseMutation
    argument :order_id, Integer, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false


    def resolve(order_id: nil)
        order = Order.find(order_id)
        order.destroy
        if order.destroy 
            { success: order.destroyed?, errors: [] }
        
        else 
            { success: false, errors: order.errors.full_messages }
        
        end
        
    end

end
