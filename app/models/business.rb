class Business < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true
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

  def self.by_category(category_id)
    self.where(category_id: category_id)
  end

  def self.search(search)
    if search
      self.joins(product: :tag)
      .where("products.name = :s OR tags.name = :s OR businesses.name = :s", s: "#{search}")
      # find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

#
# @editions = Edition.joins(model: :manufacturer)
#   .where("models.name = :q OR manufacturers.name = :q OR editions.name = :q", q: params[:q])
end
