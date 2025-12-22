class User < ApplicationRecord
  has_secure_password

  validates :username
  validates :email, uniquess: true
  validates :password
end
