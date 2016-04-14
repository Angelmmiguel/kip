require 'rails_helper'

RSpec.describe ArticlesHelper, type: :helper do
  include MaterialIcons::MaterialIconHelper

  it 'return correct HTTP method' do
    expect(save_method(create(:article))).to eq(:patch)
    expect(save_method(build(:article))).to eq(:post)
  end

  it 'check error in a field' do
    article = Article.create
    %w(title text category author).each do |field|
      expect(error?(article, field)).to eq('error')
    end
    # Valid article
    valid_article = create(:article)
    %w(title text category author).each do |field|
      expect(error?(valid_article, field)).to be_nil
    end
  end

  it 'sanitize markdown' do
    unpermitted_text =
      '<script>alert(a)</script><iframe src="http://google.com"></iframe>' \
      '<style>body { color: white }'
    # Sanitize
    output = sanitize_markdown unpermitted_text
    expect(output.html_safe?).to be_truthy
    expect(output).not_to include('script')
    expect(output).not_to include('iframe')
    expect(output).not_to include('style')
  end

  it 'returns the correct button' do
    expect(save_button(create(:article))).to include('Update')
    expect(save_button(build(:article))).to include('Save')
    # Other checks
    button = save_button(create(:article))
    expect(button).to include('</a>')
  end
end
