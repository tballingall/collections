#
class Collection < ActiveRecord::Base
  has_one :user
end
