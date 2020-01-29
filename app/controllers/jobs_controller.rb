class JobsController < ApplicationController
  def new
    @job = Job.new
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    @job.owner = current_owner
<<<<<<< HEAD

=======
    authorize @job
>>>>>>> ddda0eeae8d32fe88ff63479e2be1365663f9844
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
    @array_sitters = Sitter.where(location: @job.location)
  end

  private

  def job_params
    params.require(:job).permit(:date, :location, :number_of_dogs, :description)
  end
end
