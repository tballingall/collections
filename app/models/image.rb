#
class Image < ActiveRecord::Base
  belongs_to :closet through :user
  attr_accessor :image_uid, :image_name
  dragonfly_accessor :image
end
