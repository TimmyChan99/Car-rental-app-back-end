class User < ApplicationRecord
  has_many :reservations, dependent: :delete_all
  has_many :cars, dependent: :delete_all
end
