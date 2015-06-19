#
class Image < ActiveRecord::Base
  attr_accessor :image_uid, :image_name
  dragonfly_accessor :image
end
