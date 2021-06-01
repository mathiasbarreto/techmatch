require 'date'

class JobsController < ApplicationController
  def index
    skip_policy_scope
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    @job.offer = Offer.find(params[:offer_id])
    @job.start_date = Date.today
    if @job.save
      redirect_to jobs_path
    else
      redirect_to offer_path(offer_id)
    end
  end

  private

  def job_params
    params.require(:job).permit(:contractor_rating, :contractor_review, :employer_review, :employer_rating, :start_date)
  end
end
