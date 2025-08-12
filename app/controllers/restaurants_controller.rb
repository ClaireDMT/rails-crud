class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    # retrieve all restaurants for the DB
    date_today = Date.today
     @restaurants = Restaurant.all # returns all restaurants as instances!
  end

  def show
   # returns the restaurant asked by the user
  end

  def new
    @restaurant = Restaurant.new # initialize an empty instance to explain the form that we want to create a new restaurant
  end

  def create
    # retrieve the info of the new restaurant sent by the user, and save it to the DB
    @restaurant = Restaurant.create(restaurant_params)
    redirect_to restaurant_path(@restaurant.id)    # "restaurants/#{restaurant.id}"
  end

  def edit
    # retrieve the chosen restaurant to edit
  end

  def update
    # retrieve the info sent by the user
    # update the restaurant with the new info
    # retrieve the chosen restaurant to
    @restaurant.update(restaurant_params) # update the instance of the restaurant with filtered/permitted infos
    redirect_to restaurant_path(@restaurant.id)    # "restaurants/#{restaurant.id}"
  end

  def destroy
    # retrieve the restaurant to destroy
    # destroy the restaurant
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other # redirect to the routes that is called "restaurants"
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # get params info and filter out the unwanted attributes and returns hash with permitted info
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating)
  end
end
