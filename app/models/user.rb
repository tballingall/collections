#
class User < ActiveRecord::Base
  has_secure_password
  has_many :albums
  has_many :images
  accepts_nested_attributes_for :albums
  dragonfly_accessor :image

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :email,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
            presence: true,
            uniqueness: { case_sensitive: false }
end
