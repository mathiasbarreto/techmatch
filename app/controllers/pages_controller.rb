class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :all_users]

  def home
  end

  def my_offers
    skip_policy_scope
    @offers = current_user.offers
  end

  def my_profiles
    skip_authorization
  end

  def all_users
    skip_authorization
    if params[:query].present?
      sql_query = "skills @@ :query OR profile_summary @@ :query"
      @users = Kaminari.paginate_array(User.where(sql_query, query: "%#{params[:query]}%")).page(params[:page])
    else
      @users = User.order(:username).page params[:page]
    end
  end

  def show_user
    skip_authorization
    @user = User.find(params[:id])
  end
end
