class Level < ApplicationRecord
  has_many :groups
  has_many :hashtags
  has_many :required_hashtags, foreign_key: :required_by_level_id, class_name: "Hashtag"
end
