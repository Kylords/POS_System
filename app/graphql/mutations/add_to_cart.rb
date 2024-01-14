class Mutations::AddToCart < Mutations::BaseMutation
    argument :quantity, String, required: true
    argument :product_id, Integer, required: true

    field :cart_item, Types::CartItemType, null: false
    field :errors, [String], null: false


    def resolve(quantity: nil, product_id: nil)
        product = Product.find(product_id)
        total_price = quantity.to_i * product.price.to_i
        user = context[:current_user]
        cart_id = user.cart.id

        existing_item = CartItem.find_by(product_id: product_id, cart_id: cart_id)
        cart_item = existing_item if existing_item
        cart_item.quantity = existing_item.quantity.to_i + quantity.to_i if existing_item
        cart_item.total_price = existing_item.quantity.to_i * product.price.to_i if existing_item
        
        cart_item = CartItem.new(cart_id: cart_id, product_id: product_id, quantity: quantity, total_price: total_price) if !existing_item
        if cart_item.save 
            ActionCable.server.broadcast('notifications', { message: 'User1 did something!' })
            { cart_item: cart_item, errors: [] }
        
        else 
            { cart_item: nil, errors: cart_item.errors.full_messages }
        
        end
        
    end

end
