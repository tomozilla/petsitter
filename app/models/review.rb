class Review < ApplicationRecord
  belongs_to :owner, :sitter
end
