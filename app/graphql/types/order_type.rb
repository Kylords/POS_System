# frozen_string_literal: true

module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer
    field :product_ids, [Integer]
    field :order_type, String
    field :delivery_address, String
    field :status, String
    field :total_price, String
    field :quantity, Integer
    field :payment_id, Integer
    field :delivery_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false


    field :province, String
    field :city, String
    field :baranggay, String
    field :street, String


    field :room_unit, String
    field :floor, String
    field :building, String
    field :remarks, String
    field :nearest_landmark, String



    field :first_name, String
    field :last_name, String
    field :email, String
    field :mobile, String


    field :products, [Types::ProductType]

    field :payment, Types::PaymentType
    field :delivery, Types::DeliveryType

    
  end
end
