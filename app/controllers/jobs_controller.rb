class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.new 
  end
end
