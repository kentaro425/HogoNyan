class DropTableRegions < ActiveRecord::Migration[6.1]
  def change
    drop_table :regions do |t|
    t.string :name, default: 0, null: false
    t.timestamps null: false
  end
  end
end
