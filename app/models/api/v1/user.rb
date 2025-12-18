class User < ApplicationRecord
  before_actions :set_params, only: [ update ]
end
  def create
    user = User.create(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: error, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: :@user, status: :ok
    else
      flash[:error] = "Erro ao Alterar!"
      render json: error, status: :unprocessable_entity
    end

  private

  def set_params
    @user = User.find(params[:id])
  end

  def user_params
  params.require(:user).permit(:name, :email, :password)
  end
end
