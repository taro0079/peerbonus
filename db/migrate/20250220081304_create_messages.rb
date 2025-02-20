class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.text       :content   , null: false
      t.references :from      , foreign_key: { to_table: :users }, null: false
      t.references :to        , foreign_key: { to_table: :users }, null: false
      t.references :give_point, null: false
      t.timestamps
    end
  end
end
