# frozen_string_literal: true

module Types
  class CartItemType < Types::BaseObject
    field :id, ID, null: false
    field :cart_id, Integer
    field :product_id, Integer
    field :quantity, String
    field :total_price, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :product, Types::ProductType
  end
end
