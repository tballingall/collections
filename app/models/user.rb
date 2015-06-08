#
class User < ActiveRecord::Base
  has_secure_password
  has_many :photos

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :email,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
            presence: true,
            uniqueness: { case_sensitive: false }
end
