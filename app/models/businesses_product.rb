class BusinessesProduct < ApplicationRecord
  belongs_to :business
  belongs_to :product

end
