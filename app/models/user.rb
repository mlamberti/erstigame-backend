class User < ApplicationRecord
  belongs_to :group
  has_many :photos
  has_secure_token :auth_token
  enum gender: [ :maschi, :maschine, :pinguin ]

  before_create :default_last_seen_to_now

  def default_last_seen_to_now
    self.last_seen ||= Time.now
  end

  def invalidate
    self.invalidated = true;
    self.save!;
  end
end
