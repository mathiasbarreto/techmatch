class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @offers = Offer.all
    @current_user = current_user
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    if @offer.save
      redirect_to new_user_offer_url(@offer), notice: 'Offer was successfully created.'
    else
      render :new
    end
  end

  def edit
    @offer = Offer.find([:id])
  end

  def update
    if @offer.update(offer_params)
      redirect_to offer_path(@offer)
    else
      render :edit
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :price)
  end
end
