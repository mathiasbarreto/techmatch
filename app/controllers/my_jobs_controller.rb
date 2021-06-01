class MyJobsController < ApplicationController
  def index
    @jobs = current_user.jobs
  end
end
