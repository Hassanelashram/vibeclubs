class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]
  def index
    @clubs = Club.joins(:city).where("cities.name ILIKE ?", "%#{params[:city]}%")
  end

  def show
  end

  def edit
  end

  def update
    @club.update(club_params)
    if @club.save
      redirect_to @club
    else
      render :edit
    end
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    @club.user = current_user
    if @club.save
      redirect_to @club
    else
      render :new
    end
  end

  def destroy
    @club.destroy
    redirect_to dashboard_path
  end

  private

  def set_club
    @club = Club.find(params[:id])
  end

  def club_params
    params.require(:club).permit(:name, :address, :for_who, :table_service, :dress_code,
                                 :phone, :website, :instagram, :facebook, :city_id)
  end
end
