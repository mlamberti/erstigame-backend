class Hashtag < ApplicationRecord
  has_and_belongs_to_many :photos
  enum category: [ :catch, :sponsor, :place ]

  belongs_to :level, optional: true

  def rank
    level_id || 0
  end
end
