class BusinessesProducts < ApplicationRecord
  belongs_to :businesses
  belongs_to :products

end
