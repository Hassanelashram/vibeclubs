class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]
  def index
    @countries = Country.order(name: :desc)
  end

  def show
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to admin_path
    else
      render 'pages/admin'
    end
  end

  def edit
  end

  def update
    @country = Country.update(country_params)
    if @country.save
      redirect_to admin_path
    end
  end

  def destroy
    @country.destroy
    redirect_to admin_path
  end

  private

  def set_country
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:name, :image)
  end
end
