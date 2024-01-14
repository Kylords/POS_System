class Mutations::EditPayment< Mutations::BaseMutation
    argument :payment_id, Integer, required: true
    argument :payment_method, String, required: true
    argument :enabled, Boolean, required: true
    


    field :payment, Types::PaymentType, null: false
    field :errors, [String], null: false


    def resolve(payment_id: nil, payment_method: nil, enabled: nil)
        payment = Payment.find(payment_id)
        payment.payment_method = payment_method
        payment.enabled = enabled


        if payment.save
          
          { payment: payment, errors: [] }
        else
          { payment: nil, errors: payment.errors.full_messages }
        end
    end
end

