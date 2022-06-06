class CarSerializer < ActiveModel::Serializer
  attributes :id, :name, :reserved, :description, :price, :created_at, :updated_at, :user_id
end
