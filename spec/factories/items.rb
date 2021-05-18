FactoryBot.define do
  factory :item do
    name                     {Faker::Commerce.product_name}
    text                     {Faker::Lorem.sentence}
    category_id              {Faker::Number.between(from 1..10)}
    status_id                {Faker::Number.between(from 1..6)}
    delivery_charge_id       {Faker::Number.between(from 1..2)}
    prefectures_id           {Faker::Number.between(from 1..47)}
    delivery_days_id         {Faker::Number.between(from 1..3)}
    price                    {Faker::Number.between(from 300..9999999)}
  end
end

