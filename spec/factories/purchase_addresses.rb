FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefectures_id { Faker::Number.between(from: 1, to: 47) }
    municipalities { '八王子市' }
    street_number { '1-1' }
    building_number { '東京ハイツ' }
    phone_number { '12345678901' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
