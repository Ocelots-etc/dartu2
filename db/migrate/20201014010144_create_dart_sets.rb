class CreateDartSets < ActiveRecord::Migration
  def change
    create_table :dart_sets do |t|

      t.timestamps null: false
    end
  end
end
