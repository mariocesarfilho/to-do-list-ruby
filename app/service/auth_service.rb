class AuthService
  def self.register(user_params)
    user = User.create!(user_params)

    token = JWT.encode({ user_id: user.id },
    Rails.application.secret_key_base)

    { user: user, token: token }
  end

  def self.login(user_params)
    user = User.find_by(email: user_params[:email])
    return :invalid_credentials unless user

    return :invalid_credentials unless user.authenticate(user_params[:password])
        token = JWT.encode({ user_id: user.id },
        Rails.application.secret_key_base
        )

        { user: user, token: token }
  end
end
