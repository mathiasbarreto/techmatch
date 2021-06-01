class MyProfilesController < ApplicationController
  def show
    skip_authorization
  end
end
