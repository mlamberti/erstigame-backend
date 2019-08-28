class Group < ApplicationRecord
  has_many :users
  has_secure_token :join_token
end
