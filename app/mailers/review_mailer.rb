class ReviewMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.review_mailer.confirm.subject
  #
  def confirm(review)
    @review = review

    mail to: review.email, subject: 'Confirm your review'
  end
end
