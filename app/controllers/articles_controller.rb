#
# Articles.
#
class ArticlesController < ApplicationController
  # List all available articles grouped by category.
  #
  def index
    @articles = Article.all.asc(:category).asc(:title).group_by(&:category)
    @count = Article.count
  end
end
