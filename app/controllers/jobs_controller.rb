class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.new
  end

  def create
    @review = Review.new(review_params)
    @review = Job.find(params[:job_id])
    @review.job = @review
    @review.save
    redirect_to jobs_path(@job)
  end

  private

  def review_params
    params.require(:review).permit(:contractor_rating, :contractor_review, :employer_review, :employer_rating, :start_date)
  end
end
