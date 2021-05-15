FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password              { password }
    password_confirmation { password }
    firstname             { Gimei.name.first }
    lastname              { Gimei.name.last }
    firstname_kana        { Gimei.name.first.katakana }
    lastname_kana         { Gimei.name.last.katakana }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2016-03-31') }
  end
end
