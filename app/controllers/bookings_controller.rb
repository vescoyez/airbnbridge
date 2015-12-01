class BookingsController < ApplicationController
  before_action :set_bridge

  def index
    @bookings = Booking.where(bridge_id: @bridge.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user
    @booking.bridge_id = @bridge.id
    respond_to do |format|
      if @booking.save
        format.html { redirect_to [@bridge, @booking], notice: 'Congrats! Bridge booked.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def set_bridge
    @bridge = Bridge.find(params[:bridge_id])
  end

  def booking_params
    params.require(:booking).permit([:checkin_date, :checkout_date, :price, :people, :bridge_id, :user_id])
  end
end
