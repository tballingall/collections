class Album < ActiveRecord::Base
  belongs_to :user
  has_many :images through :user
dragonfly_accessor :image
end