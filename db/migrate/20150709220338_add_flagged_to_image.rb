class AddFlaggedToImage < ActiveRecord::Migration
  def change
    add_column :images, :flagged, :boolean, :default => false
  end
end
