class Booking < ApplicationRecord
  belongs_to :sitter
  belongs_to :job
end
