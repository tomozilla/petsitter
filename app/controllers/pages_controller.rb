class PagesController < ApplicationController
  def home
    # authenticate_sitter!
  end

  def dashboard
    if owner_signed_in?
      @owner_jobs = current_owner.jobs.order('created_at DESC')
    elsif sitter_signed_in?
      @sitter_bookings = current_sitter.bookings.order(:created_at)
    else
      redirect_to "/"
    end
  end

  def test
  end
end
