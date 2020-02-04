class SittersController < ApplicationController
  def show
    @sitter = Sitter.find(params[:id])
  end

  def update
    @sitter = Sitter.find(params[:id])
    authorize @sitter
    if @sitter.update(sitter_params)
      redirect_to myprofile_path(@sitter)
    else
      render :edit
    end
  end

  def sitter_params
    params.require(:sitter).permit(:name, :location, :photo)
  end
end
