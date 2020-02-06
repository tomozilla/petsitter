class PagesController < ApplicationController
  skip_before_action :authenticate!, only: :home 
  def home
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

  def my_profile
    if sitter_signed_in?
      @sitter_profile = current_sitter
      @sitter_review = current_sitter.reviews.order('created_at DESC')
    end
  end

  def test
  end
end
