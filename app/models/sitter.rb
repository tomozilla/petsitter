class Sitter < ApplicationRecord
  belongs_to :booking
  has_many :reviews
  validates :name, presence: true
  validates :location, presence: true
end
