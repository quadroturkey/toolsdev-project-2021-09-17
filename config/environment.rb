# Load the Rails application.
require_relative 'application'

# Load application environment variables
env_variables = File.join(Rails.root, 'config/app_environment_variables.rb')

if File.exists?(env_variables)
    load(env_variables)
end

# Initialize the Rails application.
Rails.application.initialize!
