class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.integer :user_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :status, null: false, default: 0
      t.string :title, null: false
      t.integer :breed, null: false, default: 0
      t.integer :size, null: false, default: 0
      t.integer :sex, null: false, default: 0
      t.string :age, null: false
      t.integer :vaccine, null: false, default: 0
      t.integer :surgery, null: false, default: 0
      t.string :pattern, null: false
      t.text :information, null: false

      t.timestamps
    end
  end
end
