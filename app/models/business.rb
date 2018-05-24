class Business < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  attr_accessor :new_category_name
  before_save :create_category_from_name
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
    Category.find_or_create_by(:name => new_category_name) unless new_category_name.blank?
  end

  def self.by_category(category_id)
    self.where(category_id: category_id)
  end

  def self.search(search)
    if search
      results = self.joins(products: :tags)
      .where("products.name LIKE :s OR tags.name LIKE :s OR businesses.name LIKE :s", s: "%#{search}%")
        if results.nil?
          "Looks like we couldn't find any businesses that match your search."
        else
          results
        end
      # find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      self.all
    end
  end

#
# @editions = Edition.joins(model: :manufacturer)
#   .where("models.name = :q OR manufacturers.name = :q OR editions.name = :q", q: params[:q])
end
