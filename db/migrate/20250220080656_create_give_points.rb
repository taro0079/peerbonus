class CreateGivePoints < ActiveRecord::Migration[8.0]
  def change
    create_table :give_points do |t|
      t.integer :amount, null: false
      t.references :from, foreign_key: { to_table: :users }, null: false
      t.references :to, foreign_key: { to_table: :users }, null: false
      t.timestamps
    end
  end
end
