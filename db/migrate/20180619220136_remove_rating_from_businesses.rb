class RemoveRatingFromBusinesses < ActiveRecord::Migration[5.1]
  def change
    remove_column :businesses, :rating, :integer
  end
end
