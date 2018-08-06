# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

10.times do
  User.create!(
    name: FFaker::Name.first_name,
    email: FFaker::Internet.email,
    password: 12345678
  )
end
puts "Created fake #{User.count} Uers"

User.create(
  name: "admin",
  email: "root@admin.com",
  password: "12345678",
  role: "admin",
)
puts "Default admin created!"

User.all.each do |user|
  user.questions.create!(
    title:  FFaker::LoremCN.sentence,
    description: FFaker::LoremCN.paragraph,
  )
end
puts "have created fake questions"
puts "now you have #{Question.count} comment data"

Question.all.each do |question|
  question.answers.create!(
    user: User.all.sample,
    content: FFaker::LoremCN.sentences
  )
end
puts "have created fake answers"
puts "now you have #{Answer.count} comment data"
