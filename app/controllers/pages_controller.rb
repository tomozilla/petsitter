class PagesController < ApplicationController
  # before_action is a problem.
  before_action :authenticate_sitter!, only: [:home]

  def home
    # authenticate_sitter!
  end

  def dashboard
  end

  def test
    raise
  end
end
