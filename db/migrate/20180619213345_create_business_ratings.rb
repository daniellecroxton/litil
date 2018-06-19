class CreateBusinessRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :business_ratings do |t|
      t.integer :rating

      t.timestamps
    end
  end
end
