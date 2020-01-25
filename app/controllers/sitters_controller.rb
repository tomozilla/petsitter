class SittersController < ApplicationController
  def show
    @sitter = Sitter.find(params[:id])
  end
end
