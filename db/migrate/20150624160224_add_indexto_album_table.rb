class AddIndextoAlbumTable < ActiveRecord::Migration
  def change
    add_index :albums, :user_id, name: 'index_albums_on_user_id'
  end
end
