# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :current_user, Types::UserType, null: true

    def current_user
      user = context[:current_user]
      user
    end

    field :my_orders, [Types::OrderType], null: true do
    argument :status, String, required: true
  end

    def my_orders(status: nil)
      user = context[:current_user]
      orders = Order.where(user_id: user.id)
      orders = orders.where(status: status)
      orders
    end

    field :cart, Types::CartType, null: true 

    def cart
      user = context[:current_user]
      user.cart
    end

    field :categories, [Types::CategoryType], null: true 

    def categories 
      Category.all
    end

    field :products, [Types::ProductType], null: true do
      argument :category_id, Integer, required: true
      argument :search, String, required: true
    end

    def products(category_id: nil, search: nil)

      products = Product.where(category_id: category_id) if category_id != 0
      products = Product.all if category_id == 0


      products = products.where("name ILIKE ?", "%#{search}%")
    end

    field :product, Types::ProductType, null: true do
      argument :product_id, Integer, required: false
    end

    def product(product_id: nil)
      nil
      Product.find(product_id) if product_id

    end

    field :cart_items, [Types::CartItemType], null: true do
      argument :cart_item_ids, [Integer], required: true
    end

    def cart_items(cart_item_ids: nil)
      CartItem.select{ |cart_item| cart_item_ids.include?(cart_item.id) }
    end

    field :delivery_methods, [Types::DeliveryType], null: true

    def delivery_methods
      Delivery.all
    end

    field :payment_methods, [Types::PaymentType], null: true

    def payment_methods
      Payment.all
    end

    field :latest_order, Types::OrderType, null: true do
      argument :email, String, required: true
    end

    def latest_order(email: nil)
      orders = Order.where(email: email)
      latest_order = orders.order(created_at: :desc).first
    end

    field :all_orders, [Types::OrderType], null: true do
      argument :status, String, required: true
    end

    def all_orders(status: nil)
      Order.where(status: status)
    end

    field :find_latest_order_emails, [Types::OrderType], null: true 

    def find_latest_order_emails
      latest_orders = []

      # Get distinct emails
      distinct_emails = Order.distinct.pluck(:email)

      # For each distinct email, find the latest order
      distinct_emails.each do |email|
        latest_order = Order.where(email: email).order(created_at: :desc).first
        latest_orders << latest_order if latest_order
      end

      latest_orders
      
    end

    field :delivery, Types::DeliveryType, null: true do
      argument :delivery_id, Integer, required: true
    end

    def delivery(delivery_id: nil)
      Delivery.find(delivery_id)
    end


    field :payment, Types::PaymentType, null: true do
      argument :payment_id, Integer, required: true
    end

    def payment(payment_id: nil)
      Payment.find(payment_id)
    end

    field :users, [Types::UserType], null: true 

    def users
      User.all
    end

    field :find_latest_order_mobiles, [Types::OrderType], null: true

    def find_latest_order_mobiles
      latest_orders = []

      # Get distinct emails
      distinct_mobiles = Order.distinct.pluck(:mobile)

      # For each distinct email, find the latest order
      distinct_mobiles.each do |mobile|
        latest_order = Order.where(mobile: mobile).order(created_at: :desc).first
        latest_orders << latest_order if latest_order
      end

      latest_orders
      
    end
    
    
  end
end
