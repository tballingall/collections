class Album < ActiveRecord::Base
  belongs_to :user
  has_many :images
  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false, scope: :user_id }
end