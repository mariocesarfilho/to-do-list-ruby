class AuthService
  SECURE_API = Rails.application.secrets.secret_key_base

  def self.encode(payload, exp = 12.hours.from_now)
    payload[:exp] = exp.to_i

    JWT.encode(payload, SECURE_API)
  end

  def self.decode(token)
    body = JWT.decode(token, SECURE_API)[0]

    HashWithIndifferentAccess.new(body)
  end
end
