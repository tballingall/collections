class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_uid
      t.string :image_name

      t.timestamps null: false
    end
  end
end
