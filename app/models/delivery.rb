class Delivery < ApplicationRecord
    has_many :orders
    validates_uniqueness_of :delivery_method, case_sensitive: false
end
