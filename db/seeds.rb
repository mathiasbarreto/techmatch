require 'faker'
require 'open-uri'

Job.destroy_all
Offer.destroy_all
User.destroy_all


skills = %w[ruby rails javascript html css sql python java c c++ c# spring django react statistics]
prices = [15, 50, 70, 100, 150, 250, 500, 1000, 1500, 2300, 5000, 10000] # Somehow I can't think of a better single line solution

puts 'Creating 50 users'
50.times do |i|
  user = User.create!(
    email: Faker::Internet.unique.email,
    username: Faker::Name.unique.first_name,
    password: '123123',
    skills: skills.sample(rand(3..6)).join(", "),
    profile_summary: Faker::Lorem.paragraphs(number: rand(1..3))[0]
  )
  file = URI.open(Faker::Avatar.image(size: "200x200"))
  user.photo.attach(io: file, filename: Faker::Lorem.unique.word)
end

puts "Creating 200 offers"
200.times do |i|
  offer = Offer.create!(
    title: [Faker::Hacker.verb, Faker::Hacker.adjective, Faker::Hacker.noun, 'and', Faker::Hacker.noun].join(" ").capitalize,
    description: Faker::Lorem.paragraphs(number: rand(2..4))[0].capitalize,
    price: prices.sample,
    user: User.all.sample
  )
end

puts "Creating 100 jobs"
100.times do |i|
  user = User.all.sample
  job = Job.create!(
    user: user,
    offer: Offer.where("user_id != ?", user.id).sample,
    start_date: Date.today - rand(16..60),
    contractor_review: Faker::Lorem.paragraphs(number: rand(2..4))[0],
    contractor_rating: rand(3.0..10.0).floor(1),
    employer_review: Faker::Lorem.paragraphs(number: rand(2..4))[0],
    employer_rating: rand(3.0..10.0).floor(1),
    finish_date: Date.today - rand(0..15)
  	)
end

puts 'Finished!'
