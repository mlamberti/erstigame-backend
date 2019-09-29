class Photo < ApplicationRecord
  FULL_HOURS = 2

  belongs_to :group
  belongs_to :user
  has_and_belongs_to_many :hashtags, after_add: :add_hashtag, after_remove: :remove_hashtag
  has_one_attached :picture

  validates :group, :user, presence: true

  before_create :default_date_to_now

  before_destroy :update_group_before_destroy

  def hashtag_names
    @hashtag_names || hashtags.map(&:name).join(', ')
  end

  def default_date_to_now
    self.date ||= Time.now
  end

  def points
    self.hashtags.sum(:points)
  end

  def num_catches
    self.hashtags.where(category: :catches).count
  end

  def num_places
    self.hashtags.where(category: :place).count
  end

  def num_sponsors
    self.hashtags.where(category: :sponsors).count
  end

  def num_hours
    num_hours_unweighted * people_count
  end

  def num_hours_unweighted
    prev_photo = Photo.order('date DESC').find_by('date <= ? AND id != ?', self.date, self.id)
    return FULL_HOURS unless prev_photo

    hours = (self.date - prev_photo.date) / 1.hour
    return [hours, FULL_HOURS].min
  end

  def update_group_before_destroy
    self.group.points -= self.points
    self.group.num_hours -= self.num_hours
    self.group.num_catches -= self.num_catches
    self.group.num_places -= self.num_places
    self.group.num_sponsors -= self.num_sponsors
    self.group.save!
  end

  def add_hashtag(hashtag)
    self.points += hashtag.points
    self.save!

    self.group.points += hashtag.points
    self.group.num_catches += 1 if hashtag.catch?
    self.group.num_places += 1 if hashtag.place?
    self.group.num_sponsors += 1 if hashtag.sponsor?
    self.group.save!
  end

  def remove_hashtag(hashtag)
    self.points -= hashtag.points
    self.save!

    self.group.points -= hashtag.points
    self.group.num_catches -= 1 if hashtag.catch?
    self.group.num_places -= 1 if hashtag.place?
    self.group.num_sponsors -= 1 if hashtag.sponsor?
    self.group.save!
  end

end
