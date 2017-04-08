class UsersController < ApplicationController
  before_action :verify_is_admin, only: [:admin_dash]
  def admin_dash
    @restaurants = Restaurant.all
    @users = User.all
  end
end
