class CrawlsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  before_action :verify_is_admin, only: [:destroy]
  def index
    @eating_phrases = ["Stuff your face", "Get cheesy with friends", "Pretend you're from Wisconsin", "Enjoy some gooey goodness", "Ruin your diet"]
    @crawls = Crawl.all
  end

  def new
    @crawl = Crawl.new
    @restaurants = Restaurant.all
  end

  def create
    Crawl.create(crawl_params)
    redirect_to crawls_path
  end

  def destroy
    Crawl.find(params[:id]).destroy
    flash[:notice] = "Crawl deleted"
    redirect_to crawls_path
  end

  private

  def crawl_params
    params.require(:crawl).permit(:time, :restaurant_id, :user_id)
  end
end
