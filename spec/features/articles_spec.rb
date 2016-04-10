require 'rails_helper'

RSpec.describe 'Articles integration', type: :feature do
  context 'Create an article' do
    before(:each) do
      @article = {
        title: 'test',
        category: 'test2',
        author: 'Megaman',
        text: '# Testing'
      }
    end

    it 'from index' do
      @title = 'test'
      @category = 'test2'
      # Go to edit
      visit '/'
      click_link('mode_edit')
      # Fill
      within('.articles-form') do
        fill_in 'title', with: @article[:title]
        fill_in 'author', with: @article[:author]
        fill_in 'category', with: @article[:category]
        fill_in 'text', with: @article[:text]
      end
      # Save
      click_link('Save')
      # Expect we are on show
      @article.keys.each do |field|
        next if field == :text
        expect(page).to have_content(@article[field])
      end
      # Go to home
      # We are clicking an image
      find('.logo-link').trigger('click')
      sleep(1)
      expect(page.current_path).to eq root_path
      # The title and category must be shown
      expect(page).to have_content(@article[:title])
      expect(page).to have_content(@article[:category])
    end
  end
end
