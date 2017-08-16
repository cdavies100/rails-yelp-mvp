class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show # will work from before_action
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurants_path
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save # return false if validations don't pass
      redirect_to new_restaurant_path#(@restaurant)
    else
      render :new
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :category)
    end


end
