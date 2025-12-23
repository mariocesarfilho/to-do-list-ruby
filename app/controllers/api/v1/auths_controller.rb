module Api
  module V1
    class AuthsController < ApplicationController
      def register
        if user = AuthService.register(set_params)
          render json: user, status: :created
        else
          render json: { message: "Erro ao criar usuário" }, status: :unprocessable_entity
        end
      end

      def login
        if user = AuthService.login(login_params)
          render json: user, status: :ok
        else
          render json: { message: "Email ou Senha inválidos" }, status: :unauthorized
        end
      end


      private

      def login_params
        params.require(:user).permit(:email, :password)
      end

      def set_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
    end
  end
end
