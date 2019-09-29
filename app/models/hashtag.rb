class Hashtag < ApplicationRecord
  has_and_belongs_to_many :photos
  enum category: [ :catch, :sponsor, :place ]

  belongs_to :level, optional: true
  belongs_to :required_by_level, optional: true, class_name: "Level"

  def rank
    level&.rank || 0
  end

  def to_s
    self.name
  end
end
