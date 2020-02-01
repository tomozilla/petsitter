class PagesController < ApplicationController
  # before_action is a problem.
  skip_before_action :authenticate_owner!, only: [:home]

  def home
    # authenticate_sitter!
  end

  def dashboard
    @owner_jobs = current_owner.jobs.order('created_at DESC')
  end

  def test
  end
end
