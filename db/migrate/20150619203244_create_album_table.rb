class CreateAlbumTable < ActiveRecord::Migration
  def change
    create_table :albums do |t|
    t.string :name
    t.string :username
    t.string :image
    t.string :image_uid
    end
  end
end