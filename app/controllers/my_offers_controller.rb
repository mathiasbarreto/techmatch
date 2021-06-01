class MyOffersController < ApplicationController
  def index
    skip_policy_scope
    @offers = current_user.offers
  end
end
