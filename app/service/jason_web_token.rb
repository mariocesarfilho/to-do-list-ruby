require "jwt"

class JasonWebToken
  # String aleatória para construir o token
  SECRET_KEY = Rails.application.secrets.secrete_key_base

  def self.encode(payload, exp = 12.hours.from_now)
    payload[:exp] = exp.to_i

    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    body = JWT.decode(token, SECRET_KEY)

    HashWithIndifferentAccess.new(body)
  end
end
