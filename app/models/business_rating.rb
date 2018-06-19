class BusinessRating < ApplicationRecord
  has_many :businesses
  validates :rating, presence: true
end
