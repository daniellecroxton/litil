class CreateJoinTableProductsTags < ActiveRecord::Migration[5.1]
  def change
    create_join_table :products, :tags do |t|
      t.integer :product_id
      t.integer :tag_id

    end
  end
end
