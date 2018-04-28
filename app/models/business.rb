class Business < ApplicationRecord
  belongs_to :user
  belongs_to :category
  # has_many :products, through: :bu
  mount_uploader :image, ImageUploader
end
