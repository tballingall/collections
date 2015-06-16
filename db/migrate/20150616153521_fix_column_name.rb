class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :photos, :avatar_uid, :image_uid
  end
end