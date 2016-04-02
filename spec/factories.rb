FactoryGirl.define do
  # Articles
  factory :article do
    title 'This is a title'
    author 'Yoshi'
    text '# Hello!'
    category 'My Category'

    trait :other_text do
      text 'Other text'
    end
  end
end
