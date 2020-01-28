class JobsController < ApplicationController
  def new
    @job = Job.new
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    @job.owner = current_owner
    authorize @job
    if @job.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    authorize @job
    @job.update(job_params)
  end

  def show
    @job = Job.find(params[:id])
    authorize @job
  end

  private

  def job_params
    params.require(:job).permit(:date, :location, :number_of_dogs, :description)
  end
end
