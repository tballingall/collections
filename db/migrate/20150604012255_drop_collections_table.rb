class DropCollectionsTable < ActiveRecord::Migration
  def change
    drop_table :collections
  end
end
