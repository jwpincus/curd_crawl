class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :verify_is_admin, only: [:destroy]
  def create
    @review = Restaurant.find(review_params[:restaurant_id]).reviews.create(review_params)
    redirect_to restaurant_path(@review.restaurant)
  end

  def destroy
    @restaurant = Review.find(params[:id]).restaurant
    Review.find(params[:id]).destroy
    redirect_to restaurant_path(@restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:name, :review, :rating, :restaurant_id)
  end

  
end
