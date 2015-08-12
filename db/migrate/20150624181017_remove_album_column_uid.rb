class RemoveAlbumColumnUid < ActiveRecord::Migration
  def change
    remove_column :albums, :image_uid
  end
end
