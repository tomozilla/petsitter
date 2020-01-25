class ReviewsController < ApplicationController
  def new
    @sitter = Sitter.find(params[:sitter_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @sitter = Sitter.find(params[:sitter_id])
    @review.sitter = @sitter
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
