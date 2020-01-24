# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

random_omments = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."

newSitter = Sitter.new      #=> "Christophe Bartell"
newSitter.first_name = Faker::Name.name
newSitter.last_name = Faker::Name.name
newSitter.email = Faker::Internet.email

newOwner = Owner.new
newOwner.first_name = Faker::Name.name
newOwner.last_name = Faker::Name.name
newOwner.email = Faker::Internet.email

newReview = Review.new
newReview.user = newUser
newReview.owner = newOwner
newReview.rate = Random.rand(1..5)
newReview.comments = random_omments

newJob = Job.new
newJob.owner = newOwner
newJob.date = Faker::Date.between(from: 2.days.ago, to: Date.today)
newJob.location = Faker::Address.city + " " + Faker::Address.country
newJob.number_of_dogs = Random.rand(1..8)

newBooking = Booking.new
newBooking.job = newJob
newBooking.status = "pending"
newBooking.job = newJob




Faker::Internet.email #=> "kirsten.greenholt@corkeryfisher.info"
