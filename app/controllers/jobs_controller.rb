class JobsController < ApplicationController
  def new
    @job = Job.find(params[:job_id]])
  end

  def edit
  end

  def show
  end
end
