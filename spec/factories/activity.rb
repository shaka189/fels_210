FactoryBot.define do
  factory :activity do
    action {Faker::Name.name}
    action_type {Faker::Name.name}
  end
end
