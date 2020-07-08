class CitiesController < ApplicationController
  before_action :set_city, only: [:show]
  def index
    @cities = City.all
  end

  def show
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to admin_path
      flash[:success] = 'Posted'
    else
      render 'pages/admin'
      flash[:warning] = 'Could not post'
    end
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :image, :country_id)
  end
end
