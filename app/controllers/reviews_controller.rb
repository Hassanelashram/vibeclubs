class ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
  end

  def create
    @club = Club.find(params[:club_id])
    @review = Review.new(review_params)
    @review.club = @club
    if @review.save
      flash[:alert] = 'Please check your email'
      redirect_to @club
    else
      redirect_to @club
      flash[:notice] = 'Please make sure to fill everything'
    end
  end

  def edit
  end

  def update
    @review = Review.find(params[:id])
    @review.update(confirmed: true)
    @review.save
    redirect_to root_url
    flash[:notice] = 'Your review was confirmed'
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_path
  end
  private

  def review_params
    params.require(:review).permit(:email, :name, :stars, :content)
  end
end
