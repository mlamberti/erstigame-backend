class GroupRallyeRating < ApplicationRecord
  belongs_to :group
  belongs_to :rallye_rating

  validate :one_rating_per_station

  def one_rating_per_station
    if self.group.rallye_ratings.find_by rallye_station: self.rallye_rating.rallye_station
      errors.add(:base, 'Rating for station already exists')
    end
  end
end
