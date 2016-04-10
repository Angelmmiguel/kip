require 'rails_helper'

RSpec.describe 'Articles', type: :feature do
  context 'Creation' do
    before(:each) do
      @article = {
        title: 'test',
        category: 'test2',
        author: 'Megaman',
        text: '# Testing'
      }
      @article2 = {
        title: 'test2',
        category: 'test3',
        author: 'Zero',
        text: '# Testing2'
      }
    end

    it 'from index' do
      # Go to edit
      visit '/'
      click_link 'mode_edit'
      # Fill
      fill_and_save_article(@article)
    end

    it 'from welcome' do
      visit '/'
      click_link 'Write your first article'
      # Fill
      fill_and_save_article(@article2)
    end
  end
end
