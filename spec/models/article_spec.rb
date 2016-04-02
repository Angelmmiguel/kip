require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'An Article' do
    it 'must have a title, author, category and text' do
      expect(build(:article, title: nil).save).to be_falsy
      expect(build(:article, author: nil).save).to be_falsy
      expect(build(:article, text: nil).save).to be_falsy
      expect(build(:article, category: nil).save).to be_falsy
      expect(build(:article).save).to be_truthy
    end

    it "doesn't change author" do
      article = create(:article)
      expect(article.update(author: 'Bowser')).to be_falsy
      expect(article.errors.keys).to include(:author)
    end

    it 'can search in its text' do
      number = 25
      FactoryGirl.create_list(:article, number)
      other = create(:article, :other_text)
      expect(Article.fulltext_search('Hello!', max_results: 100).size)
        .to eq(number)
      expect(Article.fulltext_search(other.text[1..5]).size).to eq(1)
    end
  end
end
