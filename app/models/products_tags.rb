class ProductsTags < ApplicationRecord
  belongs_to :tags
  belongs_to :products

end
