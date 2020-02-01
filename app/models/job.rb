class Job < ApplicationRecord
  has_one_attached :photo
  belongs_to :owner
  has_many :bookings

  validates :location, presence: true
  validates :description, presence: true
  validates :number_of_dogs, presence: true
  validates :ends_at, presence: true
  validates :starts_at, presence: true
end
