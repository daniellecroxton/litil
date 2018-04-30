class Business < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_many :businesses_products
  has_many :products, through: :businesses_products
  mount_uploader :image, ImageUploader
  scope :recent, -> { order(:created_at, :desc) }


  def self.by_category(category_id)
    self.where(:category_id => category_id)
  end
end
