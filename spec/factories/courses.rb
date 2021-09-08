FactoryBot.define do
  factory :course do
    feature     {Faker::Lorem.sentence}
    association :user
    association :score
  end
end
