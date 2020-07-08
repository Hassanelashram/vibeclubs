class CountriesController < ApplicationController
  before_action :set_country, only: [:show]
  def index
    @countries = Country.order(name: :desc)
  end

  def show
  end

  def create
    @country = Country.new(country_params)
  end

  private

  def set_country
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:name)
  end
end
