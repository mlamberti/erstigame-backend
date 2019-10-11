class Photo < ApplicationRecord
  FULL_HOURS = 2

  belongs_to :group
  belongs_to :user
  has_and_belongs_to_many :hashtags, after_add: :add_hashtag, after_remove: :remove_hashtag
  has_one_attached :picture

  validates :group, :user, presence: true

  before_create :default_date_to_now, :set_time_together_points

  after_create :update_group_after_create
  before_destroy :update_group_before_destroy

  def hashtag_names
    @hashtag_names || hashtags.map(&:name).join(', ')
  end

  def default_date_to_now
    self.date ||= Time.now
  end

  def url
    Rails.application.routes.url_helpers.rails_blob_url self.picture
  end

  def path
    Rails.application.routes.url_helpers.rails_blob_path self.picture
  end    

  def time_together_points
    self.num_hours * 1
  end

  def num_catches
    self.hashtags.where(category: :catch).count
  end

  def num_places
    self.hashtags.where(category: :place).count
  end

  def num_sponsors
    self.hashtags.where(category: :sponsor).count
  end

  def num_hours
    self.num_hours_unweighted * self.people_count
  end

  def num_hours_unweighted
    prev_photo = Photo.where(group: self.group).order('date DESC').find_by('date <= ? AND id != ?', self.date, self.id)
    return FULL_HOURS unless prev_photo

    hours = (self.date - prev_photo.date) / 1.hour
    return [hours, FULL_HOURS].min
  end

  def set_time_together_points
    self.points += self.time_together_points
  end

  def update_group_before_destroy
    self.group.points -= self.points
    self.group.num_hours -= self.num_hours
    self.group.num_catches -= self.num_catches
    self.group.num_places -= self.num_places
    self.group.num_sponsors -= self.num_sponsors
    self.group.save!
  end

  def update_group_after_create
    self.group.num_hours += self.num_hours
    self.group.points += self.time_together_points
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

  def calc_points
    self.points = self.hashtags.sum(:points) + self.time_together_points
  end

  def recalc!
    self.calc_points
    self.save!
  end

end
