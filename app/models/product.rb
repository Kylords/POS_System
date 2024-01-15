class Product < ApplicationRecord
    belongs_to :category
    has_and_belongs_to_many :orders, join_table: :orders_products
    has_many :product_quantities
end
