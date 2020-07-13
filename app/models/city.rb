class City < ApplicationRecord
  belongs_to :country
  has_many :clubs

  validates :name, :image, presence: true
end
