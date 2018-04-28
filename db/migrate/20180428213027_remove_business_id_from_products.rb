class RemoveBusinessIdFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :business_id, :integer
  end
end
