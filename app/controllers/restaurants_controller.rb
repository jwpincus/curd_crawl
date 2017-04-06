class RestaurantsController < ApplicationController
  def new
    @restaurant = Restaurant.new
    @neighborhoods = Neighborhood.all
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def index
    @restaurants = Restaurant.all
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone, :neighborhood_id)
  end
end
