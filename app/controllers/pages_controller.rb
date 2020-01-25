class PagesController < ApplicationController
  # before_action is a problem.
  skip_before_action :authenticate_owner!, only: [:home]

  def home
    # authenticate_sitter!
  end

  def dashboard
    current_owner.bookings
  end

  def test
  end
end
