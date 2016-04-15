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

    trait :unpermitted_tags do
      title 'Tags <script>var a = 1</script>'
      author 'Angel <script>var a = 2</script>'
      category 'rspec <script>var a = 3</script>'
      text 'text <script>var a = 4</script>'
    end
  end
end
