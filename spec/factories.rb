FactoryGirl.define do
  # Articles
  factory :article do
    title 'This is a title'
    author 'Yoshi'
    text '# Hello!'

    trait :other_text do
      text 'Other text'
    end
  end
end
