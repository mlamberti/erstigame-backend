class Group < ApplicationRecord
  has_many :users
  has_many :photos
  has_secure_token :join_token
  belongs_to :level, optional: true
  has_many :group_rallye_ratings
  has_many :rallye_ratings, through: :group_rallye_ratings
  has_many :rallye_stations, through: :rallye_ratings

  def rank
    level_id || 0
  end

end
