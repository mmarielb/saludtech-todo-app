class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy toggle_complete]

  # GET /tasks
  def index
    @tasks = Task.order(created_at: :desc)
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    @task.completed = false
    @task.estimated_minutes = calculate_estimation(@task.title)

    if @task.save
      redirect_to tasks_path, notice: 'Tarea creada con éxito.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /tasks/:id
  def show
  end

  # GET /tasks/:id/edit
  def edit
  end

  # PATCH/PUT /tasks/:id
  def update
    @task.assign_attributes(task_params)
    @task.estimated_minutes = calculate_estimation(@task.title)

    if @task.save
      redirect_to tasks_path, notice: 'Tarea actualizada con éxito.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/:id
  def destroy
    @task.destroy
    redirect_to tasks_path, notice: 'Tarea eliminada con éxito.'
  end

  # PATCH /tasks/:id/toggle_complete
  def toggle_complete
    @task.update(completed: !@task.completed)
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :completed, :description, :asignar_a)
  end

  def calculate_estimation(title)
    title.split.size * 5
  end
end
