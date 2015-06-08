class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :avatar_uid
      t.string :title
      t.string :image_name
      t.timestamps null: false
      t.belongs_to :closet
    end
  end
end
