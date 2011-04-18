
TWILIO_CONFIG = YAML.load_file("#{Rails.root.to_s}/config/twilio.yml")

# Load the rails application
require File.expand_path('../application', __FILE__)


# Initialize the rails application
Motivationaltext::Application.initialize!

