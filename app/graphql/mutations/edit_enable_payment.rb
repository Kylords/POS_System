class Mutations::EditEnablePayment< Mutations::BaseMutation
    argument :payment_id, Integer, required: true
    argument :enabled, Boolean, required: true
    


    field :payment, Types::PaymentType, null: false
    field :errors, [String], null: false


    def resolve(payment_id: nil, enabled: nil)
        payment = Payment.find(payment_id)
        payment.enabled = enabled


        if payment.save
          
          { payment: payment, errors: [] }
        else
          { payment: nil, errors: payment.errors.full_messages }
        end
    end
end

