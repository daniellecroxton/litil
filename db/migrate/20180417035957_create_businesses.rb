class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :full_street_address
      t.string :website
      t.string :phone
      t.integer :category_id
      t.integer :user_id
      t.integer :rating
      t.blob :image

      t.timestamps
    end
  end
end
