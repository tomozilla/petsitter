class Sitter < ApplicationRecord
  belongs_to :booking
  validates :name, presence: true
  validates :location, presence: true
end
