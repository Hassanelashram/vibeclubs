ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: 'gmail.com',
  user_name: ENV['brastodesigns@gmail.com'],
  password: ENV['letsgetrich'],
  authentication: :login,
  enable_starttls_auto: true
}
