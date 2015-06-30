#
class Image < ActiveRecord::Base
  belongs_to :album
  delegate :user, to: :album
  dragonfly_accessor :image
  validates :name, presence: true
  validates :image, presence :true
  attr_accessor :image_uid, :image_name

end
