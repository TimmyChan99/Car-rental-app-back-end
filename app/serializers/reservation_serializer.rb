class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :city, :duration, :date_reserved, :user_id, :car_id
  has_one :user
end
