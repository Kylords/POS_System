module Mutations
    class EditCartItemQuantity < BaseMutation
      argument :quantity, String, required: true
      argument :cart_item_id, Integer, required: true
  
      field :errors, [String], null: false
      field :cart_item, Types::CartItemType, null: true
  
      def resolve(quantity:, cart_item_id:)
        cart_item = CartItem.find(cart_item_id)
        cart_item.quantity = quantity
        cart_item.total_price = quantity.to_i * cart_item.product.price.to_i
        puts cart_item.total_price
        puts "huh"
        puts "huh"
        puts "huh"
        puts "huh"
      
        if cart_item.save
          { cart_item: cart_item, errors: [] }
        else
          { cart_item: nil, errors: cart_item.errors.full_messages }
        end
      end
      
    end
  end