require 'date'

class JobsController < ApplicationController
  def index
    skip_policy_scope
    @jobs = Job.all
  end

  def show
    skip_authorization
    # @job = Job.new
    @job = Job.find(params[:id])
  end

  def create
    skip_authorization
    # @review = Review.new(review_params)
    # @review = Job.find(params[:job_id])
    # @review.job = @review
    # @review.save
    # redirect_to jobs_path(@job)
    @job = Job.new(user_id: params[:user_id], offer_id: params[:offer_id])
    @job.start_date = Date.today
    if @job.save
      redirect_to jobs_path
    else
      redirect_to offer_path(offer_id)
    end
  end

  private

  def job_params
    params.require(:review).permit(:contractor_rating, :contractor_review, :employer_review, :employer_rating, :start_date, :user_id, :employer_id)
  end
end
