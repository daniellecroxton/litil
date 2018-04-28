class CreateJoinTableBusinessesProducts < ActiveRecord::Migration[5.1]
  def change
    create_join_table :businesses, :products do |t|
      t.integer :business_id
      t.integer :product_id
    end
  end
end
