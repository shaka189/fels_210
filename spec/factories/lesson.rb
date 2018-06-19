FactoryBot.define do
  factory :lesson do
    name {Faker::Name.name}
    status true
  end
end
