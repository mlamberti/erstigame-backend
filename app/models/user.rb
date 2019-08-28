class User < ApplicationRecord
  belongs_to :group
  has_secure_token :auth_token
end
