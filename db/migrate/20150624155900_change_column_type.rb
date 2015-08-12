class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :albums, :user_id, :integer
  end
end
