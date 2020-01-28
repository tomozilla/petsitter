class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @job = Job.find(params[:job_id])
    raise
    @sitter = Sitter.find(params[:sitter_id])
    @booking.job = @job
    @booking.sitter = @sitter
    authorize @booking
    if @booking.save
      redirect_to job_path(@job)
    else
      render job_path(@job)
      # :new is not existing so render to where?
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:status)
  end
end
