class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :store_name
      t.string :store_rule

      t.timestamps
    end
  end
end
