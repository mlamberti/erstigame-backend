class User < ApplicationRecord
  belongs_to :group
  has_many :photos
  has_secure_token :auth_token
  enum gender: [ :maschi, :maschine, :pinguin ]

  def invalidate
    self.invalidated = true;
    self.save!;
  end
end
