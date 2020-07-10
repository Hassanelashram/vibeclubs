ActionMailer::Base.smtp_settings = {
  address:              'smtp.postmarkapp.com',
  port:                 587,
  domain:               'vibeclubs.herokuapp.com',
  user_name:            'c1fae8ea-9a9d-4193-aa07-a1cf73f9e280',
  password:             'c1fae8ea-9a9d-4193-aa07-a1cf73f9e280',
  authentication:       :plain,
  enable_starttls_auto: true
}
