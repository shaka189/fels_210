FactoryBot.define do
  factory :category do
    name {Faker::Name.name}
    duration Settings.duration
  end
end
