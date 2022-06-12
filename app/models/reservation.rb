class Reservation < ApplicationRecord
  belongs_to :user

  validates :city, :duration, :date_reserved, presence: true
end
