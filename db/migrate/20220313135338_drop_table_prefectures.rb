class DropTablePrefectures < ActiveRecord::Migration[6.1]
  def change
    drop_table :prefectures do |t|
    t.integer :region_id, null: false
    t.integer :name, default: 0, null: false
    t.timestamps null: false
  end
  end
end
