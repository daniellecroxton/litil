class Product < ApplicationRecord
  has_many :products_tags
  has_many :tags, through: :products_tags
  attr_accessor :new_tag_name
  has_many :businesses_products
  has_many :businesses, through: :businesses_products
  mount_uploader :image, ImageUploader
  validates :name, presence: true

  def create_tag_from_name
    new_tag = Tag.find_or_create_by(name: new_tag_name)
    self.tags << new_tag
  end

  def businesses_products_attributes=(businesses_products_attributes)
    businesses_products_attributes.values.each do |attribute|
        self.save
        self.businesses_products.build(attribute)
    end
  end

  #product.rating model

end
