class Mutations::CreateDelivery< Mutations::BaseMutation
    argument :delivery_method, String, required: true
    argument :price, String, required: true
    argument :enabled, Boolean, required: true
    


    field :delivery, Types::DeliveryType, null: false
    field :errors, [String], null: false


    def resolve(delivery_method: nil, price: nil, enabled: nil)
      
        
        delivery = Delivery.create!(
          delivery_method: delivery_method,
            price: price,
            enabled: enabled
            
        )
        if delivery.save
          
          { delivery: delivery, errors: [] }
        else
          { delivery: nil, errors: delivery.errors.full_messages }
        end
    end
end

