class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def create
    @club = Club.find(params[:club_id])
    @review = Review.new(review_params)
    @review.club = @club
    if @review.save
      redirect_to @club
    else
      render @club
    end
  end

  def edit
  end

  def update
    @review = Review.find(params[:id])
    @review.update(confirmed: true)
    @review.save
    redirect_to root_url
  end


  private
  def review_params
    params.require(:review).permit(:email, :stars, :content)
  end
end
