FactoryBot.define do
  factory :word do
    content {Faker::Name.name}
    after(:build) do |word|
      answer = FactoryBot.create :answer, word: word
      word.answers.push(answer)
    end
  end
end
