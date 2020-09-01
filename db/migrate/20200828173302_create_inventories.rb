class CreateInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.integer :item_id
      t.integer :store_id
      t.float :price_result

      t.timestamps
    end
  end
end
