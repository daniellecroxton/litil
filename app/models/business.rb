class Business < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_many :businesses_products
  has_many :products, through: :businesses_products
  mount_uploader :image, ImageUploader
  scope :recent, -> { order(:created_at, :desc) }
  # accepts_nested_attributes_for :category
  #
  # def category_attributes=(category_attributes)
  #   category_attributes.values.each do |category_attribute|
  #     category = Category.find_or_create_by(category_attribute)
  #     self.category_id = category
  #   end
  # end

  def self.by_category(category_id)
    self.where(:category_id => category_id)
  end

end
