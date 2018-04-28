class Business < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :businesses_products
  has_many :products, through: :businesses_products
  mount_uploader :image, ImageUploader
end
