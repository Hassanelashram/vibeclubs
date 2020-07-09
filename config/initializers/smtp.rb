ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: 'gmail.com',
  user_name: 'brastodesigns@gmail.com',
  password: 'letsgetrich',
  authentication: :login,
  enable_starttls_auto: true
}
