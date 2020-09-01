class CreateClassifications < ActiveRecord::Migration[6.0]
  def change
    create_table :classifications do |t|
      t.string :family_description
      t.string :rule

      t.timestamps
    end
  end
end
