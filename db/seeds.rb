User.create!(name: "Hoang Thi Nhung",
             email: "hoang.thi.nhung@framgia.com",
             password: "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.all
user  = users.first
following = users[2..15]
followers = users[3..10]
following.each {|followed| user.follow(followed)}
followers.each {|follower| follower.follow(user)}

15.times do
  name = Faker::Name.title
  description = Faker::Lorem.paragraph
  cate = Category.create! name: name, description: description

  40.times do
    word = cate.words.build content: Faker::Lorem.word
    word.answers.build content: Faker::Lorem.word, correct: true
    word.answers.build content: Faker::Lorem.word, correct: false
    word.answers.build content: Faker::Lorem.word, correct: false
    word.answers.build content: Faker::Lorem.word, correct: false
    word.save!
  end
end