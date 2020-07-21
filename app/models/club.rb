class Club < ApplicationRecord
  belongs_to :user
  belongs_to :city
  belongs_to :country
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
  validates :name, :address, :photos,
            :dress_code, :phone, presence: true

  def average_rating
    total_points = 0
    average = 0
    self.reviews.each do |review|
      total_points += review.stars
      average = total_points.fdiv(reviews.count)
    end
    average.round(1)
  end
end
