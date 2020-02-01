class PagesController < ApplicationController
  # before_action is a problem.
 # skip_before_action :authenticate_owner!, only: [:home]
 # skip_before_action :authenticate_sitter!, only: [:home]
  def home
    # authenticate_sitter!
  end

  def dashboard
    if owner_signed_in?
      current_owner.bookings
    elsif sitter_signed_in?
      @sitter_bookings = current_sitter.bookings.order(:created_at)
    else
      redirect_to "/"
    end
  end

  def test
  end
end
