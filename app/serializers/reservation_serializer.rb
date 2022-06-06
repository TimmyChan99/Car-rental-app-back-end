class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :city, :duration, :date_reserved
  has_one :user
end
