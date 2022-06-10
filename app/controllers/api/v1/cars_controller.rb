class Api::V1::CarsController < ApplicationController
  before_action :set_car, only: %i[show update destroy]
  before_action :admin, only: %i[create update destroy]

  def index
    @car = Car.all
    render json: JSON.pretty_generate(@car.as_json)
  end

  def show
    @car = Car.find(params[:id])
    render json: JSON.pretty_generate(@car.as_json, except: :pictures)
  end

  def create
    car = Car.new(car_params)
    car.user_id = @user.id
    if car.save
      render json: JSON.pretty_generate(car.as_json)
    elsif car.errors.messages
      render json: { errors: car.errors.messages }
    else
      render json: { error: 'Car could not be created.' }
    end
  end

  def update
    if @car.update(car_params)
      render json: JSON.pretty_generate(@car.as_json)
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @car.destroy
      render json: { message: 'Car has been successfully deleted' }
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:name, :description, :price)
  end

  def admin
    header = request.headers['Authorization']
    header = header.split.last if header
    decoded_token = JWT.decode header, jwt_key, false, { algorithm: 'HS256' }
    @user = User.find(decoded_token[0]['user_id'])
    if @user.role == 'admin'
      @user
    else
      render json: { message: 'You do not have access to this resourse' }
    end
  end
end
