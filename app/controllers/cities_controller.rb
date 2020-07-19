class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  def index
    @cities = City.all

    respond_to do |format|
      format.html
      format.json { render json: { cities: @cities } }
    end
  end

  def autocomplete
    if params[:city]
      @cities = City.where("name ILIKE ?", "#{params[:city]}%")
    else
      @cities = []
    end
    render json: {cities: @cities}
  end

  def show
    @city.view += 1
    @city.save
    @names = @city.clubs.map {|club| club.name }
    respond_to do |format|
      format.html
      format.json { render json: { city: @city, club_name: @names} }
    end
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
      flash[:alert] = 'City was created'
    else
      redirect_to admin_path
      flash[:notice] = 'Could not create'
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
