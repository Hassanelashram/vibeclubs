class Review < ApplicationRecord
  belongs_to :club
  after_create :send_confirmation
  private

  def send_confirmation
    ReviewMailer.confirm(self).deliver_now
  end
end
