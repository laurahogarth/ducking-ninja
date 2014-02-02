RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end

def log_in_as(scope)
  sign_in scope, FactoryGirl.create(scope)
end
