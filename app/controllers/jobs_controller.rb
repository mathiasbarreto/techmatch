require 'date'

class JobsController < ApplicationController
  def index
    @jobs = policy_scope(Job)
  end

  def show
    @job = Job.find(params[:id])
    authorize(@job)
  end

  def create
    @job = Job.new(user: current_user)
    @job.offer = Offer.find(params[:offer_id]) # Usuário, offer -> usuário
    @job.start_date = Date.today
    authorize(@job)
    if @job.save
      redirect_to job_path(@job)
    else
      redirect_to offer_path(offer_id)
    end
  end
end
