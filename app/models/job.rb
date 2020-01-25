class Job < ApplicationRecord
  belongs_to :owner
  has_many :bookings
  validates :date, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :number_of_dogs, presence: true
end
