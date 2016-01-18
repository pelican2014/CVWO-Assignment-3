class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @thresholds = Threshold.all
  end
 
  def show
    @task = Task.find(params[:id])
    @thresholds = Threshold.all
    # Show the index page instead (aborted)
    # redirect_to tasks_path
  end
 
  def new
    @task = Task.new
    @task.tags << Tag.new
  end
 
  def edit
    @task = Task.find(params[:id])
  end
 
  def create
    @task = Task.new(task_params)
 
    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end
 
  def update
    @task = Task.find(params[:id])
 
    if @task.update(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end

  # Delete task and
  # Delete tag when the task to destroy is the only tagged task left
  def destroy
    @task = Task.find(params[:id])
    @task.tags.each do |tag|
      if tag.tasks.size == 1
        tag.destroy
      end
    end
    @task.destroy
 
    redirect_to tasks_path
  end
 
  private
    def task_params
      params.require(:task).permit(:created_at, :content, :priority, :due)
    end
end
