class RestaurantsController < ApplicationController
  before_action :verify_is_admin, only: [:new, :create, :destroy, :edit, :update]
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

  def destroy
    Restaurant.find(params[:id]).reviews.destroy_all
    Restaurant.find(params[:id]).destroy
    redirect_to admin_dash_path
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    @neighborhoods = Neighborhood.all
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone, :neighborhood_id)
  end
end
