FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Tea.type }
    temperature { Faker::Number.within(range: 170..200) }
    brew_time { Faker::Number.within(range: 1..6) }
  end
end