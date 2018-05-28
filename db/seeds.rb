User.create!(email: "viettienn97@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             admin: true)

10.times do |n|
  email = "example-#{n+1}@railstutorial.org"
  password = "123123"
  User.create!(email: email,
               password: password,
               password_confirmation: password)
end

Category.create!(name: "Ruby", duration: 1)
Category.create!(name: "Rails", duration: 3)
Category.create!(name: "Java", duration: 6)
Category.create!(name: "Javacript", duration: 8)
Category.create!(name: "HTML", duration: 10)
Category.create!(name: "CSS", duration: 15)
Category.create!(name: "Jquery", duration: 20)
Category.create!(name: "C#", duration: 30)
Category.create!(name: "Python", duration: 40)
Category.create!(name: "C++", duration: 50)
Category.create!(name: "Assembly", duration: 60)
  30.times do |n|
    word = Word.create!(content: Faker::Lorem.word, category_id: "#{(n%9)+1}")
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: true)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
  end
  30.times do |n|
    word = Word.create!(content: Faker::Lorem.word, category_id: "#{(n%9)+1}")
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: true)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
  end
    30.times do |n|
    word = Word.create!(content: Faker::Lorem.word, category_id: "#{(n%9)+1}")
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: true)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
  end
    30.times do |n|
    word = Word.create!(content: Faker::Lorem.word, category_id: "#{(n%9)+1}")
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: true)
  end
    30.times do |n|
    word = Word.create!(content: Faker::Lorem.word, category_id: "#{(n%9)+1}")
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: true)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
  end
    30.times do |n|
    word = Word.create!(content: Faker::Lorem.word, category_id: "#{(n%9)+1}")
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: true)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
  end
    30.times do |n|
    word = Word.create!(content: Faker::Lorem.word, category_id: "#{(n%9)+1}")
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: true)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
  end
    30.times do |n|
    word = Word.create!(content: Faker::Lorem.word, category_id: "#{(n%9)+1}")
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: true)
  end
    30.times do |n|
    word = Word.create!(content: Faker::Lorem.word, category_id: "#{(n%9)+1}")
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: true)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
  end
    30.times do |n|
    word = Word.create!(content: Faker::Lorem.word, category_id: "#{(n%9)+1}")
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: true)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
  end
    30.times do |n|
    word = Word.create!(content: Faker::Lorem.word, category_id: "#{(n%9)+1}")
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: true)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
  end
    30.times do |n|
    word = Word.create!(content: Faker::Lorem.word, category_id: "#{(n%9)+1}")
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: false)
      Answer.create!(content: Faker::Lorem.word, word_id: word.id, correct: true)
  end
