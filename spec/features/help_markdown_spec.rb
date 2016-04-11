require 'rails_helper'

RSpec.describe 'Help', type: :feature do
  context 'Markdown cheatsheet' do
    before(:each) do
      number = 25
      FactoryGirl.create_list(:article, number)
    end

    it 'must be accessible from creation' do
      # Go to create
      visit '/'
      click_link 'mode_edit'
      check_markdown_help
    end

    it 'must be accessible from edition' do
      visit edit_article_path(Article.first)
      check_markdown_help
    end
  end
end
