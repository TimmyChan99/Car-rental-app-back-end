class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable,
          jwt_revocation_strategy: JwtDenylist

  has_many :reservations, dependent: :delete_all
  has_many :cars, dependent: :delete_all
end
