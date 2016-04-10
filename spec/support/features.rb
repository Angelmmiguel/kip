# Include features support
RSpec.configure do |config|
  config.include Features::ArticleHelpers, type: :feature
end
