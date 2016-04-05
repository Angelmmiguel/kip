#
# Articles.
#
class ArticlesController < ApplicationController
  # Set the current article
  before_action :set_article, only: [:edit, :show, :update]

  # List all available articles grouped by category.
  #
  def index
    @articles = Article.all.only(:category, :title).asc(:category).asc(:title)
                       .group_by(&:category)
    @count = Article.count
  end

  # Render editor
  #
  def new
    @article = Article.new
  end

  # Show an article
  #
  def show
    markdown =
      Redcarpet::Markdown.new(
        Render::Kip, autolink: true, fenced_code_blocks: true, tables: true)
    @text = markdown.render(@article.text).gsub("\n\n", '<br/>').html_safe
  end

  # Edit an article
  #
  def edit; end

  # Update an article
  #
  def update
    @article.update(update_article_params)
    redirect_to @article
  end

  # Store a new article and redirect the user.
  #
  def create
    @article = Article.create(new_article_params)
    redirect_to @article
  end

  private

  # Set the article from params[:id]
  #
  def set_article
    @article = Article.find(params[:id])
  end

  # Article parameters
  #
  def new_article_params
    params.permit(:title, :author, :category, :text, :number_of_words)
  end

  # Article parameters
  #
  def update_article_params
    params.permit(:title, :category, :text, :number_of_words)
  end
end
