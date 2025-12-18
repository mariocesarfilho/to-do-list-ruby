module Api
  module V1
    class TasksController < ApplicationController
      before_action :set_task, only: [ :show, :update, :destroy ]

      def index
        tasks = Task.all
        render json: tasks
      end

      def show
        render json: @task
      end


      def create
        task = Task.create(task_params)

        if task.save
          render json: task, status: :created
        else
          render json: task.erros, status: :unprocessable_entity
        end
      end

      def update
        if @task.update(task_params)
          render json: @task, status: :ok
        end
        render json: @task.errors, status: :unprocessable_entity
      end

      def destroy
        @task.destroy
        head :no_content
      end

      private

      def set_task
        @task = Task.find(params[:id])
      end

      def task_params
        params.require(:task).permit(:name)
      end
    end
  end
end
