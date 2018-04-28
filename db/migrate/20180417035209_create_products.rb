class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :business_id
      t.string :image

      t.timestamps
    end
  end
end
