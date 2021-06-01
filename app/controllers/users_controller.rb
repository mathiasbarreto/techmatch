class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    skip_policy_scope
    @users = User.all
  end

  def show
    skip_authorization
    @user = User.find(params[:id])
  end
end
