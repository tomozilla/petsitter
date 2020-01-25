require 'faker'

# Assign comment string for reviews
random_text = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."

20.times do
  # Create a new sitter
  newSitter = Sitter.new
  newSitter.name = Faker::Name.name
  newSitter.email = Faker::Internet.email
  newSitter.location = Faker::Address.city + " " + Faker::Address.country

  # Create a new Owner
  newOwner = Owner.new
  newOwner.name = Faker::Name.name
  newOwner.email = Faker::Internet.email
  newOwner.location = Faker::Address.city + " " + Faker::Address.country

    # Create 3 new job with a relevant owner
    3.times. do
      newJob = Job.new
      newJob.owner = newOwner
      newJob.date = Faker::Date.between(from: 2.days.ago, to: Date.today)
      newJob.location = Faker::Address.city + " " + Faker::Address.country
      newJob.number_of_dogs = Random.rand(1..8)
      newJob.description = random_text

        # Create 4 bookings with a relevant job
        4.times do
          newBooking = Booking.new
          newBooking.job = newJob
          newBooking.status = "pending"
          newBooking.job = newJob
          newBooking.sitter = newSitter
        end
    end
    # Create 6 reviews with relevant user and owner
    6.times do 
      newReview = Review.new
      newReview.user = newUser
      newReview.owner = newOwner
      newReview.rate = Random.rand(1..5)
      newReview.comments = random_text
    end
end
