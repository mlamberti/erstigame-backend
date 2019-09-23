class RallyeRating < ApplicationRecord
  belongs_to :rallye_station
  has_secure_token :token
  has_and_belongs_to_many :groups
end
