class Photo < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_and_belongs_to_many :hashtags, before_add: :update_points, before_remove: :update_points, after_add: :update_group, after_remove: :update_group
  has_one_attached :picture

  validates :group, :user, presence: true

  before_create :default_date_to_now

  before_save :update_points
  after_save :update_group

  def default_date_to_now
    self.date ||= Time.now
  end

  def update_points(hashtag = nil)
    self.group.points -= self.points
    self.points = self.hashtags.sum(:points)
  end

  def update_group(hashtag = nil)
    self.group.points += self.points
    self.group.save!
  end
end
