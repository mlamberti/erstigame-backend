class Photo < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_and_belongs_to_many :hashtags
  has_one_attached :picture

  validates :group, :user, presence: true

  before_create :default_date_to_now
  def default_date_to_now
    self.date ||= Time.now
  end
end
