class Product < ApplicationRecord
  has_and_belongs_to_many :tags
  has_many :businesses_products
  has_many :businesses, through: :businesses_products
  mount_uploader :image, ImageUploader

end
