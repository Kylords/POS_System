# frozen_string_literal: true

module Types
  class CartType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :cart_items, [Types::CartItemType]

    field :total_price, Integer

    def total_price
      object.cart_items.sum { |item| item.total_price.to_f }
    end
  end
end
