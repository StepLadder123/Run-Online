FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {Faker::Date.backward}
    sex_id                {Faker::Number.between(from: 2, to: 4)}
    area_id               {Faker::Number.between(from: 2, to: 48)}
    profile               {Faker::Lorem.sentence}
  end
end
