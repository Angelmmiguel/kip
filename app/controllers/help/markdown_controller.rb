#
# Help of markdown.
#
class Help::MarkdownController < ApplicationController
  # Cache always index
  caches_action :index

  # Markdown cheatsheet
  #
  def index
    markdown =
      Redcarpet::Markdown.new(
        Render::Kip, autolink: true, fenced_code_blocks: true, tables: true)
    # Load from file
    @cheatsheet =
      markdown.render(markdown_cheatsheet).gsub("\n\n", '<br/>').html_safe
  end

  private

  # Return content of markdown.md
  #
  # @return [String] Content of markdown.md
  #
  def markdown_cheatsheet
    File.read(Rails.root.join('markdown.md'))
  end
end
