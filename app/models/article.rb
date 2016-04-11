#
# Represent articles of Kip
#
class Article
  include Mongoid::Document
  include Mongoid::Timestamps

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
  index({ category: 1 }, unique: false, name: 'category_index')
  index({ author: 1 }, unique: false, name: 'author_index')
  index({ title: 'text', category: 'text', text: 'text', author: 'text' },
        weights: { category: 10, author: 9, title: 8, text: 5 },
        name: 'search_index')

  # Validations
  validates :title, :text, :author, :category, presence: true
  validate :author_not_changed

  # Search a string in Articles
  #
  # @param query [String] String to search
  # @param to_model [boolean] Convert results to model
  # @return [Array of Hash, Array of Article] Results sort by ratings
  #
  def self.search(query, to_model: false, limit: 15, read_time: false)
    res =
      Article.collection
             .find('$text' => { '$search' => query })
             .projection(id: 1, title: 1, category: 1, author: 1,
                         number_of_words: 1, score: { '$meta' => 'textScore' })
             .sort(score: { '$meta' => 'textScore' })
             .limit(limit)
             .entries
    if !to_model && read_time
      # Return with read_time
      res.map! do |r|
        r.merge!(read_time: (r[:number_of_words].to_f / WORDS_PER_MINUTE).ceil)
      end
    else
      # Return result
      to_model ? res.map! { |r| new(r) } : res
    end
  end

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
