class Photo < ActiveRecord::Base
  extend Dragonfly::Model
  dragonfly_accessor :avatar
  belongs_to :user, through => :closet
end
