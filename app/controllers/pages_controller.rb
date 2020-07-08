class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @countries = Country.all.order(created_at: :asc).limit(3)
    @featured = Club.all.limit(3)
  end

  def admin
    @city = City.new
    @country = Country.new
  end

  def dashboard
  end
end
