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

  def update
    updated_status = params["booking"]["action"]
    @booking = Booking.find(params[:id])
    @booking.status = updated_status
    authorize @booking
    @booking.save!
    update_job_and_bookings if updated_status == "confirmed"
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:job_id).permit(:job_id)
  end

  def update_job_and_bookings
    job = @booking.job
    job.status = "confirmed"
    job.save!
    job.bookings.each do |booking|
      unless booking.status == "confirmed"
        booking.status = "declined"
        authorize booking
        booking.save!
      end
    end 
  end
end
