class Owner < ApplicationRecord
  has_many :jobs, :reviews
  validates :name, presence: true
  validates :location, presence: true
end
