FactoryBot.define do
  factory :score do
    date                  {Faker::Date.backward}
    distance              {Faker::Number.between(from: 0.01, to: 99.99)}
    hour                  {Faker::Number.between(from: 1, to: 23)}
    minute                {Faker::Number.between(from: 1, to: 59)}
    second                {Faker::Number.between(from: 1, to: 59)}
    area_id               {Faker::Number.between(from: 2, to: 48)}
    association :user

    after(:build) do |score|
      score.image.attach(io: File.open('public/images/test-image.jpg'), filename: 'test-image.jpg')
    end
  end
end
