FactoryBot.define do
  factory :subscription do
    title { "Tea Subscription # #{Faker::Number.between(from: 1, to: 100)}" }
    price { Faker::Number.between(from: 1.0, to: 45.00).round(2) }
    status { Faker::Boolean.boolean }
    frequency { Faker::Number.between(from: 3, to: 45) }
  end
end