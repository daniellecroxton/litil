class AddProductRatingToBusinessesProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :businesses_products, :product_rating, :integer
  end
end
