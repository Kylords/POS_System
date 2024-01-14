class Mutations::DeleteCartItem < Mutations::BaseMutation
    argument :cart_item_id, Integer, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false


    def resolve(cart_item_id: nil)
        cart_item = CartItem.find(cart_item_id)
        cart_item.destroy
        if cart_item.destroy 
            { success: cart_item.destroyed?, errors: [] }
        
        else 
            { success: false, errors: cart_item.errors.full_messages }
        
        end
        
    end

end
