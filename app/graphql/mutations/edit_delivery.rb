class Mutations::EditDelivery< Mutations::BaseMutation
    argument :delivery_id, Integer, required: true
    argument :price, String, required: true
    argument :delivery_method, String, required: true
    argument :enabled, Boolean, required: true
    


    field :delivery, Types::DeliveryType, null: false
    field :errors, [String], null: false


    def resolve(delivery_id: nil, price: nil, delivery_method: nil, enabled: nil)
        delivery = Delivery.find(delivery_id)
        delivery.price = price
        delivery.delivery_method = delivery_method
        delivery.enabled = enabled


        if delivery.save
          
          { delivery: delivery, errors: [] }
        else
          { delivery: nil, errors: delivery.errors.full_messages }
        end
    end
end

