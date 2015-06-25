#
class Image < ActiveRecord::Base
  belongs_to :user, through: :album
  attr_accessor :image_uid, :image_name
  dragonfly_accessor :image
end
