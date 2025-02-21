class CreateHoldPoints < ActiveRecord::Migration[8.0]
  def change
    create_table :hold_points do |t|
      t.integer    :amount, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
