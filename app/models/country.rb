class Country < ApplicationRecord
  has_many :cities
  has_many :clubs


  validates :name, :image, presence: true
end
