FactoryBot.define do
  factory :item do
    name                     { Faker::Commerce.product_name }
    text                     { Faker::Lorem.sentence }
    category_id              { Faker::Number.between(from: 1, to: 10) }
    status_id                { Faker::Number.between(from: 1, to: 6) }
    deliverycharge_id       { Faker::Number.between(from: 1, to: 2) }
    prefectures_id           { Faker::Number.between(from: 1, to: 47) }
    deliverydays_id         { Faker::Number.between(from: 1, to: 3) }
    price                    { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
