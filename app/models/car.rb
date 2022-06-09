class Car < ApplicationRecord
  has_one :reservation
  belongs_to :user

  has_many_attached :pictures
end
