class OffersController < ApplicationController

  def index
    @offers = Offer.all
    @offers = policy_scope(Offer).order(created_at: :desc)
  end

  def show
    @offer = Offer.find(params[:id])
    authorize @offer
  end

  def new
    @offer = Offer.new
    authorize @offer
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    authorize @offer
    if @offer.save!
      redirect_to offer_path(@offer)
    else
      @offer = Offer.new(offer_params)
      render :new
    end  
  end

  def edit
    @offer = Offer.find(params[:id])
    authorize @offer
    render :new
  end

  def update
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.update(offer_params)
    redirect_to offer_path(@offer)
  end

  def destroy
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.destroy
    redirect_to offers_path
  end

  private
  def offer_params
    params.require(:offer).permit(:car_model, :car_photo, :price_per_km, :available_seats)
  end
end
