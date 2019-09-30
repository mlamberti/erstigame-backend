class Hashtag < ApplicationRecord
  has_and_belongs_to_many :photos
  enum category: [ :catch, :sponsor, :place ]

  belongs_to :level, optional: true
  belongs_to :required_by_level, optional: true, class_name: "Level"

  validate :not_required_before_available

  def not_required_before_available
    return unless self.required_by_level

    errors.add(:required_by_level, "must be greater than or equal to level (Hashtag #{self.name})") unless
      self.required_by_level.rank >= self.rank
  end

  def rank
    level&.rank || 0
  end

  def to_s
    self.name
  end
end
