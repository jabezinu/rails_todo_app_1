class TasksController < ApplicationController
  # This finds a specific task when we need it
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  # READ - Show all tasks (like opening your notebook)
  def index
    @tasks = Task.all
  end

  # READ - Show one specific task
  def show
    # @task is already found by find_task
  end

  # CREATE - Show the form to make a new task
  def new
    @task = Task.new
  end

  # CREATE - Actually save the new task
  def create
    @task = Task.new(task_params)
    
    if @task.save
      redirect_to @task, notice: 'Task was created successfully!'
    else
      render :new
    end
  end

  # UPDATE - Show the form to edit a task
  def edit
    # @task is already found by find_task
  end

  # UPDATE - Actually save the changes
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was updated successfully!'
    else
      render :edit
    end
  end

  # DELETE - Remove a task
  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Task was deleted successfully!'
  end

  private

  # Helper method to find a task
  def find_task
    @task = Task.find(params[:id])
  end

  # Security helper - only allow these fields to be saved
  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end
end