#
# Represent articles of Kip
#
class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::FullTextSearch

  # Fields
  field :title
  field :text
  field :author
  field :draft, type: Boolean, default: false
  field :collaborators, type: Array, default: []
  field :category, type: String

  # Versions
  # embeds_many :versions, class_name: "ArticleVersion"

  # Indexes
  index({ category: 1 }, unique: true, name: 'category_index')

  # Search
  fulltext_search_in :text

  # Validations
  validates :title, :text, :author, :category, presence: true
  validate :author_not_changed

  private

  # Check if the author as been changed after save.
  def author_not_changed
    return unless author_changed? && persisted?
    errors.add(:author, 'Change of author not allowed!')
  end
end
