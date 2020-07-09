class ReviewsController < ApplicationController


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


  private
  def review_params
    params.require(:review).permit(:email, :stars, :content)
  end
end
