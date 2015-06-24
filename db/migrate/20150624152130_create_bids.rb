class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.references :listing, index: true, foreign_key: true, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.integer :amount, null: false
      t.boolean :completed, default: false

      t.timestamps null: false
    end
  end
end
