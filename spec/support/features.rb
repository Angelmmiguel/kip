# Empty module
module Features; end

# Include features support
RSpec.configure do |config|
  config.include Features::ArticleHelpers, type: :feature
end
