class CreatePrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :prefectures do |t|
      t.integer :region_id, null: false
      t.integer :name, null: false, default: 0

      t.timestamps
    end
  end
end
