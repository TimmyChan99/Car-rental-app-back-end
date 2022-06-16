require 'swagger_helper'

describe 'Cars Endpoints' do 
	path '/api/v1/cars' do
		get '/api/v1/cars' do
			tags 'cars'
			produces 'application/json'
			
			response '200', 'Get cars' do
				User.create(name: 'user', email: 'user@dev.co', password: '123456', id: 1)
				Car.create(name: 'BMW', description: 'blue', price: 15, reserved: true, user_id: 1)
				run_test!
			end
		 end	
	end
  
end
