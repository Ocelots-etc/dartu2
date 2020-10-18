class CreateDarts < ActiveRecord::Migration
  def change
    create_table :darts do |t|
      t.string :name
      t.string :condition
      t.string :manufacturer
      t.string :body
      t.string :shaft
      t.string :flight
      t.integer :dart_set_id
      t.timestamps null: false
    end
  end
end
