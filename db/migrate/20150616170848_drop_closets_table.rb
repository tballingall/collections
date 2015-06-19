class DropClosetsTable < ActiveRecord::Migration
  def change
    drop_table :closets
  end
end
