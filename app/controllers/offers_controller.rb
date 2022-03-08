class OffersController < ApplicationController

  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save!
      redirect_to offer_path(@offer)
    else
      @offer = Offer.new(offer_params)
      render :new
    end  
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer.user = current_user
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
  end

  def destroy
    @offer.user = current_user
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to offers_path
  end

  private
  def offer_params
    params.require(:offer).permit(:car_model, :car_photo, :price_per_km, :available_seats)
  end
end
