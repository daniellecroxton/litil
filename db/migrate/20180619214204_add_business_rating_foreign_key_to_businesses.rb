class AddBusinessRatingForeignKeyToBusinesses < ActiveRecord::Migration[5.1]
  def change
    add_column :businesses, :business_rating_id, :integer
  end
end
