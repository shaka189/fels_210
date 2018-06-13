FactoryBot.define do
  factory :answer do
    content {Faker::Name.name}
    correct true
  end
end
