FactoryBot.define do
  factory :user do
    sequence(:email){Faker::Internet.email}
    password "foobar"
    password_confirmation "foobar"

    trait :invalid_email do
      email {Faker::Name.name}
    end

    trait :admin do
      admin true
    end

    trait :user do
      admin false
    end
  end
end
