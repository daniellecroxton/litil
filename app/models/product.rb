class Product < ApplicationRecord
  has_many :products_tags
  has_many :tags, through: :products_tags
  has_many :businesses_products
  has_many :businesses, through: :businesses_products
  mount_uploader :image, ImageUploader

end
