class Payment < ApplicationRecord
    has_many :orders
    validates_uniqueness_of :payment_method, case_sensitive: false
end
