#
# Search for articles
#
class Articles::SearchController < ApplicationController
  # Set search
  before_action :set_search

  # Search by an item and return the list of coincidences
  #
  def index
    render json: {
      q: @search,
      results: Article.search(@search, read_time: true)
    }
  end

  private

  # Initialize search var
  #
  def set_search
    @search = params[:q]
  end
end
