#
class User < ActiveRecord::Base
  has_secure_password
  has_one :profile
  has_many :collections

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email
end
