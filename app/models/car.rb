class Car < ApplicationRecord
	has_one :reservation
	belongs_to :user
end
