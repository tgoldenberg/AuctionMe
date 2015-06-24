class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :user, index: true, foreign_key: true, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.string :condition, null: false
      t.boolean :completed, default: false

      t.timestamps null: false
    end
  end
end
