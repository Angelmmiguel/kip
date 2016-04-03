#
# Represent articles of Kip
#
class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::FullTextSearch

  # Average read Time
  WORDS_PER_MINUTE = 310

  # Fields
  field :title
  field :text
  field :author
  field :draft, type: Boolean, default: false
  field :collaborators, type: Array, default: []
  field :number_of_words, type: Integer, default: 0
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

  # Get and approximation of read time per article
  #
  # @return [Integer] minutes to read the article
  #
  def read_time
    (number_of_words.to_f / WORDS_PER_MINUTE).ceil
  end

  private

  # Check if the author as been changed after save.
  def author_not_changed
    return unless author_changed? && persisted?
    errors.add(:author, 'Change of author not allowed!')
  end
end
