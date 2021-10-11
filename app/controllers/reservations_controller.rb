class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
    authorize @reservation
  end

  def index
    @reservations_as_customer = policy_scope(current_user.reservations.includes(:invoice))
    @reservations_as_owner = policy_scope(current_user.my_reservations.includes(:invoice))

  end
  def create
    @reservation = Reservation.new(reservation_params)
    @ship = Ship.find(params[:ship_id])
    @reservation.ship = @ship
    @reservation.user = current_user
    @reservation.price = calculate_price
    @reservation.negotiation_status = 'apply'

    if @reservation.save
      authorize @reservation
      redirect_to ships_path
      #redireccionar pag para ver reservaciones
    else
      ship_path(params[:ship_id])
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(negotiation_status: "confirmation")
    authorize @reservation
    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:reservation_start, :reservation_end, :people_in_reservation)
  end
  def calculate_price
    if @reservation.reservation_end.nil? || @reservation.reservation_start.nil?
      return
    else
    length = @reservation.reservation_end.to_date - @reservation.reservation_start.to_date
    length = length.to_i
    @ship.price * length
    end
  end
end
