class Mutations::CreatePayment< Mutations::BaseMutation
    argument :payment_method, String, required: true
    argument :enabled, Boolean, required: true
    


    field :payment, Types::PaymentType, null: false
    field :errors, [String], null: false


    def resolve(payment_method: nil, enabled: nil)
      
        
        payment = Payment.create!(
          payment_method: payment_method,
            enabled: enabled
        )
        if payment.save
          
          { payment: payment, errors: [] }
        else
          { payment: nil, errors: payment.errors.full_messages }
        end
    end
end

