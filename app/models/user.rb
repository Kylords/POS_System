class User < ApplicationRecord
    has_one :cart
    has_secure_password
    has_many :orders
end
