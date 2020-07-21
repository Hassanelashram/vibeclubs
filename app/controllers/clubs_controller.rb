class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @clubs = Club.all
    if params[:city].present?
      @clubs = Club.joins(:city, :country).where("cities.name ILIKE ?", "%#{params[:city]}%")
    end

    if params[:public].present?
      @clubs = @clubs.where(for_who: 'Public')
    end

    if params[:table].present?
      @clubs = @clubs.where(table_service: 'true')
    end
  end

  def show
    @similar = Club.where.not(id: @club.id)
    @similar = @similar.where(city: @club.city).limit(3)
  end

  def edit
  end

  def update
    @club.update(club_params)
    if @club.save
      redirect_to @club
      flash[:notice] = 'Club created'
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
    params.require(:club).permit(:name, :address, :for_who, :table_service, :dress_code, :genre, :open_from, :closes_at,
                                 :phone, :website, :instagram, :country_id, :facebook, :city_id, photos: [], day: [])
  end
end
