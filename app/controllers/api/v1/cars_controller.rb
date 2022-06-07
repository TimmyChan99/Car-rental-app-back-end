class Api::V1::CarsController < ApplicationController
  def index
    @car = Car.all
    render json: JSON.pretty_generate(@car.as_json)
  end

  def show
    @car = Car.find(params[:id])
    render json: JSON.pretty_generate(@car.as_json)
  end
end
