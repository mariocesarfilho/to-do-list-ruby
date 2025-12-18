module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [ :update ]

      def create
        user = User.create(user_params)

        if user.save
          render json: user, status: :created
        else
          flash[:alert] = "Erro ao criar usuário."
          render json: user.errors, status: :unprocessable_entity
        end
      end

      def update
        if @user.update(set_password)
          render json: @user, status: :ok
        else
          flash[:alert] = "Erro ao alterar usuário."
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

      def set_password
        params.require(:user).permit(:password, :password_confirmation, :current_password)
      end
    end
  end
end
