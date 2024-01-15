class ProductQuantity < ApplicationRecord
    belongs_to :product
    belongs_to :order
    has_many :product_quantities
end
