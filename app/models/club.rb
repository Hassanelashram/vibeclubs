class Club < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many_attached :photos

  validates :name, :photos, :address,
            :dress_code, :phone, presence: true
end
