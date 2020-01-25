class SittersController < ApplicationController
  def index
    @sitters = Sitter.all
  end

  def show
    @sitter = Sitter.find(params[:id])
  end
end
