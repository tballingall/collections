class Album < ActiveRecord::Base
  belongs_to :user
  has_many :images
dragonfly_accessor :image
end