# Add mongoid matchers to Rspec
RSpec.configure do |config|
  config.include Mongoid::Matchers, type: :model
  config.use_transactional_fixtures = false

  # Clean before suite
  config.before :each do
    # Mongoid.purge! # This line delete indexes too!
    Article.destroy_all
  end
end
