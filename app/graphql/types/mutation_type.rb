# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :login_user, mutation: Mutations::LoginUser
    field :logout_user, mutation: Mutations::LogoutUser

    field :create_user, mutation: Mutations::CreateUser

    field :edit_cart_item_quantity, mutation: Mutations::EditCartItemQuantity

    field :delete_cart_item, mutation: Mutations::DeleteCartItem

    field :add_to_cart, mutation: Mutations::AddToCart

    field :create_order, mutation: Mutations::CreateOrder



    field :create_product, mutation: Mutations::CreateProduct
    field :create_category, mutation: Mutations::CreateCategory
    field :edit_product, mutation: Mutations::EditProduct

    field :edit_delivery, mutation: Mutations::EditDelivery
    field :edit_enable_delivery, mutation: Mutations::EditEnableDelivery
    field :edit_enable_payment, mutation: Mutations::EditEnablePayment


    field :create_delivery, mutation: Mutations::CreateDelivery
    field :create_payment, mutation: Mutations::CreatePayment

    field :change_order_status, mutation: Mutations::ChangeOrderStatus
    field :delete_order, mutation: Mutations::DeleteOrder

    
  end
end
