class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def create
    @booking = Booking.new
    @job = Job.find(params[:job_id])
    @sitter = Sitter.find(params[:sitter_id])
    @booking.job = @job
    @booking.sitter = @sitter
    @booking.status = "pending"
    authorize @booking
    if @booking.save!
      redirect_to job_path(@job)
    else
      render job_path(@job)
      # :new is not existing so render to where?
    end
  end

  private

  def booking_params
    params.require(:job_id).permit(:job_id)
  end
end
