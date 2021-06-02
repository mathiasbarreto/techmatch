require 'date'

class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit]

  def index
    @jobs = policy_scope(Job)
  end

  def edit
    render 'review'
    authorize(@job)
  end

  def show
    authorize(@job)
  end

  def create
    @job = Job.new(user: current_user)
    @job.offer = Offer.find(params[:offer_id])
    @job.start_date = Date.today
    authorize(@job)
    if @job.save
      redirect_to job_path(@job)
    else
      redirect_to offer_path(offer_id)
    end
  end

  def update
    @job = Job.find(params[:id])
    authorize(@job)
    @job.finish_date = Date.today
    if @job.update(job_params)
      redirect_to job_path(@job)
    else
      render :review
    end
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    if @job.user == current_user
      return params.require(:job).permit(:employer_review, :employer_rating)
    end
    params.require(:job).permit(:contractor_review, :contractor_rating)
  end
end
