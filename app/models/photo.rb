class Photo < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_and_belongs_to_many :hashtags
end
