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

  # Add an error to the input when it's needed
  #
  # @param article [Article] Model to check errors
  # @param field [String, Symbol] Field to check the error
  # @return [String] Error or empty string
  #
  def error?(article, field)
    return if article.errors.empty?
    article.errors.messages.keys.include?(field.to_sym) ? 'error' : nil
  end

  # Sanitize markdown text
  #
  # @param text [Safe String] HTML from markdown article
  # @return [Safe String] HTML without any scripts or dangerous tags
  #
  def sanitize_markdown(text)
    scrubber = Rails::Html::TargetScrubber.new
    scrubber.tags = %w(script style iframe)
    # Sanitize
    sanitize text, scrubber: scrubber
  end

  # Return save button of Article form based on the article status
  # (new or saved)
  #
  # @return [String] Safe String with the button
  #
  def save_button(article)
    text = article.persisted? ? 'Update' : 'Save'
    link_to "#{text} #{material_icon.save.css_class('small')}".html_safe, '',
            class: 'btn btn-light article-save'
  end
end
