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
      # Go to create
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

  context 'Edition' do
    before(:each) do
      @article = create(:article)
      @new_title = 'This is a new title, OMG'
    end

    it 'an existent article' do
      visit '/'
      # Click on title
      expect(page).to have_content(@article.title)
      click_link @article.title
      # Click on edit
      sleep(1)
      click_link 'border_color'
      # Save
      fill_and_save_article({ title: @new_title }, button: 'Update')
    end
  end
end
