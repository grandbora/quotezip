# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
QuotezipApp::Application.initialize!


# Sendgrid config
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => 'heroku.com' #TODO: get rid of hardcoded domain
}
ActionMailer::Base.delivery_method ||= :smtp