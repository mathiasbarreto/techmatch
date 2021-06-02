# Descobrir como criar usuários com o devise aqui!!
require 'faker'

Job.destroy_all
Offer.destroy_all
User.destroy_all

puts 'Creating 10 users + offers...'
10.times do |i|
  user = User.create!(
    email: Faker::Internet.email,
    username: Faker::Name.unique.first_name,
    password: '123123',
    skills: "#{%w[python ruby javascript].sample} | #{%w[HTML CSS].sample} | #{%w[Sqlite3 PostgreSQL].sample}"
    profile_summary:
  )


  offer = Offer.create!(
    title: Faker::Name.unique.last_name,
    description: Faker::Company.catch_phrase,
    price: Faker::Number.positive,
    user: user
  )
  job = Job.create!(
    user: user,
    offer: offer,
    start_date: Date.today + i,
    contractor_review: "text qualquer",
    contractor_rating: 3.5,
    employer_review: "string qq",
    employer_rating: 3.0
  	)
  puts "#{i + 1}. #{user.username}"
  puts "#{i + 1}. #{offer.title}"
end

puts 'Creating admin user...'
1.times do |i|
  user = User.create!(
    email: 'admin@gmail.com',
    username: 'admin',
    password: '123456',
    skills: "#{%w[python ruby javascript].sample} | #{%w[HTML CSS].sample} | #{%w[Sqlite3 PostgreSQL].sample}"
  )


  offer = Offer.create!(
    title: Faker::Name.unique.last_name,
    description: Faker::Company.catch_phrase,
    price: Faker::Number.positive,
    user: user
  )
  job = Job.create!(
    user: user,
    offer: offer,
    start_date: Date.today + i,
    contractor_review: "text qualquer",
    contractor_rating: 3.5,
    employer_review: "string qq",
    employer_rating: 3.0
    )
  puts "#{i + 1}. #{user.username}"
  puts "#{i + 1}. #{offer.title}"
end

puts 'Finished!'
