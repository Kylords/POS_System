class Order < ApplicationRecord
    belongs_to :user
    belongs_to :delivery
    belongs_to :payment
    has_many :product_quantities
  
    has_and_belongs_to_many :products, join_table: :orders_products
  
    accepts_nested_attributes_for :products
  
    
  end
  