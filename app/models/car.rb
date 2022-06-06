class Car < ApplicationRecord
  has_one :reservation
  belongs_to :user

  has_one_attached :image
end
