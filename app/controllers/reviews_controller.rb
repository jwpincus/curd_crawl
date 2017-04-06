class ReviewsController < ApplicationController
  def create
    @review = Restaurant.find(review_params[:restaurant_id]).reviews.create(review_params)
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:name, :review, :rating, :restaurant_id)
  end
end
