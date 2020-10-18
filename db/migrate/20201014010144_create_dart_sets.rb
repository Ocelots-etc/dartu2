class CreateDartSets < ActiveRecord::Migration
  def change
    create_table :dart_sets do |t|
      t.string :name
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
