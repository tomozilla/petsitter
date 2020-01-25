class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @job = Job.find(params[:job_id])
    @booking.job = @job
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
