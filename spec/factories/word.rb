FactoryBot.define do
  factory :word do
    content {Faker::Name.name}
  end
end
