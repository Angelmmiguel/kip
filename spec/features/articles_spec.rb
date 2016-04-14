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

  context 'Validation' do
    before(:each) do
      @article = create(:article)
    end

    it 'should validate all fields when create' do
      visit new_article_path
      click_link('Save')
      sleep(1)
      # User musn't be redirected
      expect(page.current_path).to eq(new_article_path)
      %w(title author category text).each do |field|
        expect(page).to have_selector(".article-#{field}.error")
      end
    end

    it 'should validate all fields when edit' do
      visit edit_article_path(@article)
      # Clear elements
      %w(title category text).each do |field|
        fill_in field, with: ''
      end
      # Try to update
      click_link('Update')
      sleep(1)
      # User musn't be redirected
      expect(page.current_path).to eq(edit_article_path(@article))
      %w(title category text).each do |field|
        expect(page).to have_selector(".article-#{field}.error")
      end
    end
  end

  context 'Visualization' do
    before(:each) do
      @article = create(:article, :unpermitted_tags)
    end

    it 'must escape unpermitted tags' do
      visit article_path(@article)
      %w(title author category).each do |field|
        script = @article.send(field)
                         .scan(%r{(\w+)<script>.*<\/script>}).flatten.first
        # Expect the text include the content of unpermitted tags
        expect(page).to have_content(script)
      end
      # check text
      script = @article.text.scan(%r{<script>(.*)<\/script>}).flatten.first
      # Expect the text include the content of unpermitted tags
      expect(page).to have_content(script)
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

  context 'Search' do
    before(:each) do
      number = 25
      FactoryGirl.create_list(:article, number)
      @other_title = 'Supernintendo'
      create(:article, title: @other_title)
    end

    it 'show only 15 more relevant articles' do
      visit '/'
      # Fill input
      fill_in 'search', with: 'Title'
      sleep(1)
      expect(page).to have_selector('.article-result', count: 15)
    end

    it 'show only the article' do
      visit '/'
      # Fill input
      fill_in 'search', with: @other_title
      sleep(1)
      expect(page).to have_selector('.article-result', count: 1)
      expect(page).to have_content(@other_title)
    end

    it 'must show a call to action when scroll down' do
      visit '/'
      # Fill input
      fill_in 'search', with: 'Title'
      sleep(1)
      find_link 'Start an article about Title'
      # Fill input
      fill_in 'search', with: @other_title
      sleep(1)
      find_link "Start an article about #{@other_title}"
    end
  end
end
