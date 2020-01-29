require 'faker'

Booking.destroy_all
puts "Bookings Destroyed"
Job.destroy_all
puts "Jobs Destroyed"
Review.destroy_all
puts "Reviews Destroyed"
Owner.destroy_all
puts "Owners Destroyed"
Sitter.destroy_all
puts "Sitters Destroyed"

output_text = ""
# Assign comment string for reviews
random_text = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr,  sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum."
location_choice = ["Meguro", "Shibuya", "Ikebukuro", "Ueno"]


40.times do
  # Create a new sitter
  newSitter = Sitter.new
  newSitter.name = Faker::Name.name
  newSitter.email = Faker::Internet.email
  newSitter.password = "111111"
  newSitter.location = location_choice[rand(0..3)]
  newSitter.save!
  # Create a new Owner
  newOwner = Owner.new
  newOwner.name = Faker::Name.name
  newOwner.email = Faker::Internet.email
  newOwner.password = "111111"
  newOwner.location = location_choice[rand(0..3)]
  newOwner.save!
    # Create 3 new job with a relevant owner
    3.times do
      newJob = Job.new
      offset = rand(Owner.count)
      rand_owner = Owner.offset(offset).first
      newJob.owner = rand_owner
      newJob.date = Faker::Date.between(from: 2.days.ago, to: Date.today)
      newJob.location = location_choice[rand(0..3)]
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
output_text << "=====Owner====\n"  
output_text << newOwner.email + "\n"  
output_text << "password: " + newOwner.password + "\n"

# Create 3 new job with a relevant owner
2.times do
  newJob = Job.new
  newJob.owner = newOwner
  newJob.date = Faker::Date.between(from: 2.days.ago, to: Date.today)
  newJob.location = location_choice[rand(0..3)]
  newJob.number_of_dogs = Random.rand(1..8)
  newJob.description = random_text
  newJob.save!

    # Create 4 bookings with a relevant job
    3.times do
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
4.times do 
  newReview = Review.new
  offset = rand(Sitter.count)
  rand_sitter = Sitter.offset(offset).first
  newReview.sitter = rand_sitter
  newReview.owner = newOwner
  newReview.rate = Random.rand(1..5)
  newReview.comment = random_text
  newReview.save!
end

puts "DB updated"

Owner.where(email: "grace@plug.com").first.jobs.each do |job|
  output_text << "=====Job ID====\n"  
  output_text << job.id.to_s + "\n"
  Booking.where(job_id: job.id).each do |booking|
    output_text << "   =====Booking ID====\n"  
    output_text << "   " + booking.id.to_s + "\n"
    output_text << "   =====Sitter ID===\n"     
    output_text << "   " + Sitter.where(id: booking.sitter_id).first.id.to_s + "\n"
  end
end

puts "first print out saved"

output_text << "====Sitter Locations====\n"
Sitter.all.each do |sitter|
  output_text << sitter.location + "\n"
end

puts output_text