require "bcrypt"

class PasswordService
  def self.hash_password(password)
    BCrypt::Password.create(password)
  end
end
