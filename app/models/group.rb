class Group < ApplicationRecord
  has_many :users
  has_many :photos
  has_secure_token :join_token
  belongs_to :level, optional: true
  has_many :group_rallye_ratings
  has_many :rallye_ratings, through: :group_rallye_ratings
  has_many :rallye_stations, through: :rallye_ratings

  before_save :update_level

  def update_level
    return unless self.num_hours >= self.level.num_hours
    return unless self.num_places >= self.level.num_places
    return unless self.num_catches >= self.level.num_catches
    return unless self.num_sponsors >= self.level.num_sponsors

    self.level = Level.find_by(rank: self.level.rank + 1)
  end

  def num_hours
    self.time_together / 3600.0
  end

  def rank
    level.rank
  end

  def hashtags
    Hashtag.joins(:level).where("levels.rank <= ?", self.rank)
  end

end
