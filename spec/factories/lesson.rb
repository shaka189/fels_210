FactoryBot.define do
  factory :lesson do
    name {Faker::Internet.email}
    status true
  end
end
