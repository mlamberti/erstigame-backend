class RallyeRating < ApplicationRecord
  belongs_to :rallye_station
  has_secure_token :token
  has_many :group_rallye_ratings
  has_many :groups, through: :group_rallye_ratings
end
