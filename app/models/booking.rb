class Booking < ApplicationRecord
  belongs_to :job
  belongs_to :sitter
  STATUSES = ['pending', 'confirmed', 'completed', 'declined']
  validates_inclusion_of :status, :in => STATUSES
end
