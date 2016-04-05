#
# Custom Markdown render
#
module Render
  # Custom render for Kip.
  class Kip < Redcarpet::Render::HTML
    # Custom headers for Kip. This add a an ID to navigate to it inside the page
    #
    def header(text, header_level)
      tag = "h#{header_level}".to_sym
      id = header_id(text)
      "<#{tag} id=\"#{id}\">#{header_link(id)}#{text}</#{tag}>".html_safe
    end

    private

    # Generate a link only visible on hover to link the user to a title
    #
    # @param id [String] ID of the header
    # @return [String] HTML Safe anchor
    #
    def header_link(id)
      # Add a material icon
      "<a href=\"##{id}\">"\
      '<i class="material-icons">link</i></a>'.html_safe
    end

    # Return an identifier for the title to navigate to it
    #
    # @param text [String] Text of the title
    # @return [String] CSS ID
    #
    def header_id(text)
      text.downcase.gsub(/\s+/, '-')
    end
  end
end
