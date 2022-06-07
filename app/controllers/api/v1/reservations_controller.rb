class Api::V1::ReservationsController < ApplicationController
  def index
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded_token = JWT.decode header, nil, false
    data = decoded_token[0]['user_id']
    reservations = Reservation.where(user_id: data)

    render json: reservations
  end

  def create
    reservation = Reservation.new(reservation_params)

    if reservation.save
      render json: reservation
    else
      render json: { errors: 'Reservation not created' }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:car_id, :user_id, :date_reserved, :duration, :city)
  end
end
