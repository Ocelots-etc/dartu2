class CreateDarts < ActiveRecord::Migration
  def change
    create_table :darts do |t|

      t.timestamps null: false
    end
  end
end
