class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :is_admin?, only: :admin
  def home
    @countries = Country.all.order(created_at: :asc).limit(3)
    @featured = Club.all.limit(3)
  end

  def admin
   unless is_admin?
    redirect_to root_url
    flash[:notice] = 'You are not allowed'
   end
      @city = City.new
      @country = Country.new
  end

  def dashboard
  end

  private
  def is_admin?
    current_user.admin == true
  end
end
