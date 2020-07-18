class FeaturesController < ApplicationController

  def create
    @feature = Feature.new(club_id: params[:id])
    if @feature.save
      redirect_to admin_path
    else
      redirect_to root_url
    end
  end
end
