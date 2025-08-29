class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy toggle_complete]

  # GET /tasks
  def index
    @tasks = Task.order(created_at: :desc)
  end

  # GET /tasks/:id
  def show; end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/:id/edit
  def edit; end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: 'Tarea creada. Estimación en proceso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH /tasks/:id
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Tarea actualizada.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/:id

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Tarea eliminada con éxito.'
  end

  # PATCH /tasks/:id/toggle_complete
  def toggle_complete
    @task.update(completed: !@task.completed)
    redirect_to tasks_path, notice: 'Estado actualizado.'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date)
  end
end
