class Business < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, required: true
  attr_accessor :new_category_name
  has_many :businesses_products
  has_many :products, through: :businesses_products
  validates :name, presence: true
  mount_uploader :image, ImageUploader
  scope :recent, -> { order("businesses.created_at DESC").limit(3) }

  def create_category_from_name
    new_category = Category.find_or_create_by(name: new_category_name)
    self.category = new_category
  end

  def self.search(search)
    if search != ""
      where("name LIKE ?", "%#{search}%")

      # self.joins(products: :tags)
      # .select('*')
      # .where("products.name LIKE :s OR tags.name LIKE :s OR businesses.name LIKE :s", s: "%#{search}%").all
    else
      self.all
    end
  end


end
