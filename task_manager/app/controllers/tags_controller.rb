class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def create
    @task = Task.find(params[:task_id])

    # If tag already exists, create a record linking the tag and associated task
    # if not, create the tag under the task
    if Tag.exists?(name: tag_params[:name])
    	if !(@task.tags.exists?(name: tag_params[:name]))
    		@task.tags << Tag.find_by(name: tag_params[:name])
    	end
    else
    	@tag = @task.tags.create(tag_params)
    end

    redirect_to task_path(@task)
  end

  # Destroy record linking task_id and tag_id in the joining table
  # Only destroy tag object when there is no tasks associated with it
  def destroy
  	@task = Task.find(params[:task_id])
    @tag = Tag.find(params[:id])

    @tag.tasks.destroy(@task)
    if @tag.tasks.empty?
    	@tag.destroy
    end

    redirect_to task_path(@task)
  end

  private
    def tag_params
      params.require(:tag).permit(:name)
    end
end
