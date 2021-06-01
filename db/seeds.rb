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
    password: Faker::Alphanumeric.alpha(number: 6)
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