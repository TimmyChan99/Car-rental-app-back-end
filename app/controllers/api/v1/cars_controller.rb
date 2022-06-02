class Api::V1::CarsController < ApplicationController

	def show
		@car = Car.find(params[:id])
		render json: { car: @car }
	end
end
