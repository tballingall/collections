class AddImageIdColumnToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :image_id,  :integer
  end
end
