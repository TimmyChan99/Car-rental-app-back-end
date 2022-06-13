class Car < ApplicationRecord
  has_one :reservation
  belongs_to :user

  has_one_attached :pictures

  validates :name, :description, :price, presence: true
end
