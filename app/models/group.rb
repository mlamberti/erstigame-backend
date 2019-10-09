class Group < ApplicationRecord
  has_many :users
  has_many :photos
  has_secure_token :join_token
  belongs_to :level, optional: true
  has_many :rallye_ratings
  has_many :rallye_stations, through: :rallye_ratings

  before_create :default_number, :default_level

  def default_number
    self.number ||= (Group.maximum(:number) || 0) + 1;
  end

  def default_level
    self.level = Level.find_by rank: 1
  end

  def update_level
    return unless self.num_hours >= self.level.num_hours
    return unless self.num_places >= self.level.num_places
    return unless self.num_catches >= self.level.num_catches
    return unless self.num_sponsors >= self.level.num_sponsors
    return unless (self.level.required_hashtags - self.hashtags_done).empty?

    self.level = Level.find_by(rank: self.level.rank + 1)
  end

  def num_hours
    self.time_together / 3600.0
  end

  def rank
    level.rank
  end

  def hashtags_available
    Hashtag.joins(:level).where("levels.rank <= ?", self.rank)
  end

  def hashtags_done
    self.photos.sum &:hashtags
  end

  def rallye_points
    self.rallye_ratings.sum &:points
  end

  def calc_points
    self.photos.sum &:points
  end

  def calc_num_hours
    self.photos.sum &:num_hours
  end

  def calc_num_hours_unweighted
    self.photos.sum &:num_hours_unweighted
  end

  def calc_num_catches
    self.photos.sum &:num_catches
  end

  def calc_num_places
    self.photos.sum &:num_places
  end

  def calc_num_sponsors
    self.photos.sum &:num_sponsors
  end

end
