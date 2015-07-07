class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :albums, :username, :user_id
  end
end
