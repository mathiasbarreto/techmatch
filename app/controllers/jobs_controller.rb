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
    @job = Job.new(job_params)
    @job.offer = Offer.find(params[:offer_id])
    @job.start_date = Date.today
    authorize(@job)
    if @job.save
      redirect_to jobs_path
    else
      redirect_to offer_path(offer_id)
    end
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end
  def job_params
    params.require(:job).permit(:contractor_rating, :contractor_review, :employer_review, :employer_rating, :start_date)
  end
end
