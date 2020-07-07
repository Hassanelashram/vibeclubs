class Club < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many_attached :photos
end
