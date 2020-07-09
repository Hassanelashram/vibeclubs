class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  def index
    @cities = City.all
  end

  def show
  end

  def edit
  end

  def update
    @city.update(city_params)
    if @city.save
      redirect_to admin_path
    end
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

  def destroy
    @city.destroy
    redirect_to admin_path
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :image, :country_id)
  end
end
