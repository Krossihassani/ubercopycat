class BookingsController < ApplicationController
    
  def index
    @bookings = Booking.all
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      @booking = Booking.new(booking_params)
      render :new
    end  
  end

  def edit
    @booking = Booking.find(params[:id])
    authorize @booking
    render :new
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  private
  def booking_params
    params.require(:booking).permit(:departing_from, :going_to, :estimated_pickup_time, :date, :pick_up_time, :status)
  end

end
