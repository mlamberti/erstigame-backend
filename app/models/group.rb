class Group < ApplicationRecord
  has_many :users
  has_many :photos
  has_secure_token :join_token
  belongs_to :level, optional: true

  def rank
    level_id || 0
  end
end
