class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :last_name, true
    change_column_null :users, :first_name, true
    change_column_null :users, :last_name_kana, true
    change_column_null :users, :first_name_kana, true
    change_column_null :users, :postal_code, true
    change_column_null :users, :address, true
    change_column_null :users, :phone, true
  end
end
