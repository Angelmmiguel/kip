FactoryGirl.define do
  # Articles
  factory :article do
    sequence(:title) { |n| "Title #{n}" }
    author 'Yoshi'
    text '# Hello!'
    category 'My Category'

    trait :other_text do
      text 'Other text'
    end
  end
end
