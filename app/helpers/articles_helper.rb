#
# Functions to build interface of Articles
#
module ArticlesHelper
  # Set the HTTP method for Article form
  #
  # @return [Symbol] HTTP method
  #
  def save_method(article)
    article.persisted? ? :patch : :post
  end

  # Return save button of Article form based on the article status
  # (new or saved)
  #
  # @return [String] Safe String with the button
  #
  def save_button(article)
    text = article.persisted? ? 'Update' : 'Save'
    link_to "#{text} #{material_icon.save.css_class('small')}".html_safe, '',
            class: 'article-save'
  end
end
