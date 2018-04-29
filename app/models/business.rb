class Business < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_many :businesses_products
  has_many :products, through: :businesses_products
  mount_uploader :image, ImageUploader
end
