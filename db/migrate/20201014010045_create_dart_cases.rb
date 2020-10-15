class CreateDartCases < ActiveRecord::Migration
  def change
    create_table :dart_cases do |t|

      t.timestamps null: false
    end
  end
end
