class Country < ApplicationRecord
  has_many :cities, dependent: :destroy
  has_many :clubs, dependent: :destroy



  validates :name, :image, presence: true
end
