class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  def index
    @offers = policy_scope(Offer)
  end

  def show
  end

  def new
    @offer = Offer.new
    authorize(@offer)
  end

  def create
    @offer = Offer.new(offer_params)
    authorize(@offer)
    @offer.user = current_user
    if @offer.save
      redirect_to offer_url(@offer), notice: 'Offer was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @offer.update(offer_params)
      redirect_to offer_path(@offer)
    else
      render :edit
    end
  end

  def destroy
    @offer.destroy
    redirect_to offers_url
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :description, :price)
  end

  def set_offer
    @offer = Offer.find(params[:id])
    authorize(@offer)
  end

end
