class RemoveAlbumColumns < ActiveRecord::Migration
  def change
    remove_column :albums, :image, :image_uid
  end
end
