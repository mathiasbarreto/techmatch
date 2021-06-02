require 'date'

class JobsController < ApplicationController
  before_action :set_job, only: [:show, :review_freelancer, :review_employer]
  def index
    @jobs = policy_scope(Job)
  end

  def review_employer
    render 'review'
    authorize(@job)
  end

  def review_freelancer
    render 'review'
    authorize(@job)
  end

  def show
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
  
  private

  def set_job
    @job = Job.find(params[:id])
  end
end
