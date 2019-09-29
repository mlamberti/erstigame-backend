class RallyeStation < ApplicationRecord
  has_many :rallye_ratings
  has_many :groups, through: :rallye_ratings
  has_secure_token :token
end
