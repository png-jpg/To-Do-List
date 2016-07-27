class TasksController < ApplicationController
  
  before_action :all_tasks, only: [:index, :create, :update, :destroy]

  before_action :set_task, only: [:edit, :update, :destroy]

  

  # GET /tasks/new
  def destroy
    @task.destroy
  end

  def new
    @task = Task.new
  end

  def update
    @task.update(task_params)
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.create(task_params)
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def all_tasks
      @tasks = Task.order(:deadline)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:description, :deadline)
    end
end
