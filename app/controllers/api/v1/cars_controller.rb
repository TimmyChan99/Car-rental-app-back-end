class Api::V1::CarsController < ApplicationController
  def show
    @car = Car.find(params[:id])
    render json: JSON.pretty_generate(@car.as_json, except: :pictures)
  end
end
