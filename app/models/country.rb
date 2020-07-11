class Country < ApplicationRecord
  has_many :cities


  validates :name, :image, presence: true
end
