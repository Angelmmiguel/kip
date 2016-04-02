# Add mongoid matchers to Rspec
RSpec.configure do |config|
  config.include Mongoid::Matchers, type: :model
end
