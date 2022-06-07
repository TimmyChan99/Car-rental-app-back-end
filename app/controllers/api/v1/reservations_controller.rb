class Api::V1::ReservationsController < ApplicationController
  def index
    user = User.find_by(email: params[:email])
    reservations = Reservation.where(["user_id = :id", { id: user.id.to_s }])

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
