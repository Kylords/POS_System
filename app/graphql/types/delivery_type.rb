# frozen_string_literal: true

module Types
  class DeliveryType < Types::BaseObject
    field :id, ID, null: false
    field :delivery_method, String
    field :price, String
    field :enabled, Boolean
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
