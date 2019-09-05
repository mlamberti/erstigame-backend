class Hashtag < ApplicationRecord
  has_and_belongs_to_many :photos

  belongs_to :level, optional: true

  def rank
    level_id || 0
  end
end
