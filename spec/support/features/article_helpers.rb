module Features
  # Helpers for article editor
  module ArticleHelpers
    # Fill an article with the daata from the Hash
    #
    # @param article [Hash] Field of the article
    #
    def fill_article(article)
      within('.articles-form') do
        article.keys.each do |field|
          fill_in field.to_s, with: article[field]
        end
      end
    end

    # Fill and article and save. Check show page and index.
    #
    # @param article [Hash] Field of the article
    #
    def fill_and_save_article(article, button: 'Save')
      fill_article(article)
      # Save
      click_link(button)
      # Expect we are on show
      article.keys.each do |field|
        next if field == :text
        expect(page).to have_content(article[field])
      end
      # Go to home
      # We are clicking an image
      find('.logo-link').trigger('click')
      sleep(1)
      expect(page.current_path).to eq root_path
      # The title and category must be shown
      expect(page).to have_content(article[:title])
      expect(page).to have_content(article[:category])
    end
  end
end
