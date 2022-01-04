FactoryBot.define do
  factory :item do
    name {"hoge"}
    price {300}
    description {Faker::Lorem.sentence}
    cost_id {2}
    duration_id {2}
    prefecture_id {2}
    category_id {2}
    brand_id {2}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
