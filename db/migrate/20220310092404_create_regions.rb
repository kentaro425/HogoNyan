class CreateRegions < ActiveRecord::Migration[6.1]
  def change
    create_table :regions do |t|
      t.integer :name, null: false, default: 0

      t.timestamps
    end
  end
end
