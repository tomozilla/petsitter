require 'faker'

Booking.destroy_all
Job.destroy_all
Review.destroy_all
Owner.destroy_all
Sitter.destroy_all


# Assign comment string for reviews
random_text = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."

20.times do
  # Create a new sitter
  newSitter = Sitter.new
  newSitter.name = Faker::Name.name
  newSitter.email = Faker::Internet.email
  newSitter.password = "111111"
  newSitter.location = Faker::Address.city + ", " + Faker::Address.country
  newSitter.save!

  # Create a new Owner
  newOwner = Owner.new
  newOwner.name = Faker::Name.name
  newOwner.email = Faker::Internet.email
  newOwner.password = "111111"
  newOwner.location = Faker::Address.city + ", " + Faker::Address.country
  newOwner.save!

    # Create 3 new job with a relevant owner
    3.times do
      newJob = Job.new
      offset = rand(Owner.count)
      rand_owner = Owner.offset(offset).first
      newJob.owner = rand_owner
      newJob.date = Faker::Date.between(from: 2.days.ago, to: Date.today)
      newJob.location = Faker::Address.city + " " + Faker::Address.country
      newJob.number_of_dogs = Random.rand(1..8)
      newJob.description = random_text
      newJob.save!

        # Create 4 bookings with a relevant job
        4.times do
          newBooking = Booking.new
          newBooking.status = "pending"
          newBooking.job = newJob
          offset = rand(Sitter.count)
          rand_sitter = Sitter.offset(offset).first
          newBooking.sitter = rand_sitter
          newBooking.save!
        end
    end
    # Create 6 reviews with relevant user and owner
    6.times do 
      newReview = Review.new
      offset = rand(Sitter.count)
      rand_sitter = Sitter.offset(offset).first
      newReview.sitter = rand_sitter
      offset = rand(Owner.count)
      rand_owner = Owner.offset(offset).first
      newReview.owner = rand_owner
      newReview.rate = Random.rand(1..5)
      newReview.comment = random_text
      newReview.save!
    end
end

# Create a new Owner
newOwner = Owner.new
newOwner.name = "Grace Jang"
newOwner.email = "grace@plug.com"
newOwner.password = "111111"
newOwner.location = "Meguro"
newOwner.save!

# Create 3 new job with a relevant owner
3.times do
  newJob = Job.new
  newJob.owner = newOwner
  newJob.date = Faker::Date.between(from: 2.days.ago, to: Date.today)
  newJob.location = Faker::Address.city + " " + Faker::Address.country
  newJob.number_of_dogs = Random.rand(1..8)
  newJob.description = random_text
  newJob.save!

    # Create 4 bookings with a relevant job
    4.times do
      newBooking = Booking.new
      newBooking.status = "pending"
      newBooking.job = newJob
      offset = rand(Sitter.count)
      rand_sitter = Sitter.offset(offset).first
      newBooking.sitter = rand_sitter
      newBooking.save!
    end
end
# Create 6 reviews with relevant user and owner
6.times do 
  newReview = Review.new
  offset = rand(Sitter.count)
  rand_sitter = Sitter.offset(offset).first
  newReview.sitter = rand_sitter
  newReview.owner = newOwner
  newReview.rate = Random.rand(1..5)
  newReview.comment = random_text
  newReview.save!
end