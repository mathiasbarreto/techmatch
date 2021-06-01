class MyJobsController < ApplicationController
  def index
    skip_policy_scope
    @jobs = current_user.jobs
  end
end
