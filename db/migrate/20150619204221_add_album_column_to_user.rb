class AddAlbumColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :album_uid,  :string
  end
end
