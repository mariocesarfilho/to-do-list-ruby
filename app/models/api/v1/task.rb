class Task < ApplicationRecord
  before_actions :set_params, only: [ :update ]

  def create
    task = Task.create(task_params)
    if task.save
      render json: task, status: :created
    else
      render json: error, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render json: :@task, status: :ok
    else
      flash[:error] = "Erro ao Alerar!"
      render json: error, status: :unprocessable_entity
    end
  end

  private

  def set_params
    @task = Task.find(params[:id])
  end

  def task_params
  params.require(:task).permit(:name)
  end
end
