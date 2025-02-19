class CreatePointDecreases < ActiveRecord::Migration[8.0]
  def change
    create_table :point_decreases do |t|
      t.references :user, null: false
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
