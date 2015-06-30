class DropProfilesTable < ActiveRecord::Migration
  def change
    drop_table :Profiles
  end
end
