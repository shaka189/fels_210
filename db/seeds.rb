User.create!(email: "viettienn97@gmail.com",
             password: "123123",
             password_confirmation: "123123",
             admin: true)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "123123"
  User.create!(email: email,
               password: password,
               password_confirmation: password)
end

10.times do
  name = Faker::Name.name
  description = Faker::Lorem.sentence
  categories = Category.create!(name: name)

  30.times do
    word = Category.all.sample.words.create!(content: Faker::Lorem.word)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: true)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
  end
end
