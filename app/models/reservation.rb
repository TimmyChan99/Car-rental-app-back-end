class Reservation < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_one :car

  validates :city, :duration, :date_reserved, presence: true
end
