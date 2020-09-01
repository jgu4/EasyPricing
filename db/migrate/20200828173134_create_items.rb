class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_number
      t.string :item_description
      t.integer :cost_id
      t.integer :user_id
      t.integer :classification_id

      t.timestamps
    end
  end
end
