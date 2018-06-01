class Business < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, required: true
  attr_accessor :new_category_name
  has_many :businesses_products
  has_many :products, through: :businesses_products
  validates :name, presence: true
  mount_uploader :image, ImageUploader
  scope :recent, -> { order("businesses.created_at DESC").limit(3) }

  # accepts_nested_attributes_for :category
  #
  # def category_attributes=(category_attributes)
  #   category_attributes.values.each do |category_attribute|
  #     category = Category.find_or_create_by(category_attribute)
  #     self.category_id = category
  #   end
  # end

  def create_category_from_name
    # create_category(:name => new_category_name) unless Category.find_by(name: new_category_name)
    new_category = Category.find_or_create_by(name: new_category_name)
    self.category = new_category
  end

  def self.by_category(category_id)
    self.where(category_id: category_id)
  end

  def self.search(search)
    if search != ""
      # where(".name LIKE ?", "%#{search}%")
      #
      # self.where(name: "%#{search}%").or(self.products.where(name: "%#{search}%"))
      #

      self.joins(products: :tags)
      .where("products.name LIKE :s OR tags.name LIKE :s OR businesses.name LIKE :s", s: "%#{search}%")
    else
      self.all
    end
  end

end
