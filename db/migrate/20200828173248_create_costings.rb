class CreateCostings < ActiveRecord::Migration[6.0]
  def change
    create_table :costings do |t|
      t.float :cost_value
      t.integer :item_id
      t.string :costing_type

      t.timestamps
    end
  end
end
