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

            response '200', 'Get cars' do
                run_test! do |response|
                    data = json
                    expect(json.size).to eq 1
                end
                path '/api/v1/cars/{id}' do
                    get '/api/v1/cars/{id}' do
                        tags 'cars'
                        produces 'application/json'
                        parameter name: :id, in: :path, type: :string, required: true
                        
                        response '200', 'Get car detail' do
                            Car.create(name: 'Jeep', description: 'blue', price: 15, reserved: true, user_id: 1, id: 1)
                            let(:id) { '1' }
                            run_test!
                        end
                        response '200', 'Get car detail' do
                            Car.create(name: 'Jeep', description: 'blue', price: 15, reserved: true, user_id: 1, id: 1)
                            let(:id) { '1' }
                            run_test!
            
                     end	
                     path '/api/v1/cars' do
                        post '/api/v1/cars' do
                            tags 'cars'
                            produces 'application/json'
                            parameter name: :Authorization, in: :header, type: :string, required: true
                            parameter name: :car, in: :body, schema: {
                        type: :object,
                        properties: {
                          name: { type: :string },
                          reserved: { type: :boolean },
                          description: { type: :string },
                                    price: { type: :decimal }
                        },
                        required: %w[name description price]
                      }
                
                            response '200', 'Get cars' do
                                @user = User.create!(id: 2, name: 'Rida', email: 'example@mail.com', password: 'password', role: 'admin')
                                let(:Authorization) { 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.Ge9PnbYXkEn78GM4luhDfg9Y8NTsIkDv-zHhjSRBSPc' }
                                let(:car) { {
                                    name: 'Renault',
                            description: 'blue',
                            price: 15,
                            user_id: 2
                                } }
                                run_test!
                            end
                
                            response '200', 'Create a nw car for not authorized user' do
                                let(:Authorization) { 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.Ge9PnbYXkEn78GM4luhDfg9Y8NTsIkDv-zHhjSRBSPc' }
                                let(:car) { {
                                    name: 'Renault',
                            description: 'blue',
                            price: 15,
                            user_id: 2
                                } }
                                run_test! do |response|
                                    expect(json['message']).to eq 'You do not have access to this resourse'
                                end
                            end
                
                
                    end
            
	end
  
end
