class ReviewsController < ApplicationController
  def new
    @sitter = Sitter.find(params[:sitter_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.owner = current_owner
    @sitter = Sitter.find(params[:sitter_id])
    @review.sitter = @sitter
    authorize @review
    if @review.save
      redirect_to sitter_path(@sitter)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rate, :comment)
  end
end
