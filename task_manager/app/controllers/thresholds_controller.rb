class ThresholdsController < ApplicationController
  def index
    @thresholds = Threshold.all
  end
 
  def show
    # @threshold = threshold.find(params[:id])
    # Show the index page instead
    redirect_to thresholds_path
  end
 
  def new
    @threshold = Threshold.new
  end
 
  def edit
    @threshold = Threshold.find(params[:id])
  end
 
  def create
    @threshold = Threshold.new(threshold_params)
 
    if @threshold.save
      redirect_to @threshold
    else
      render 'new'
    end
  end
 
  def update
    @threshold = Threshold.find(params[:id])
 
    if @threshold.update(threshold_params)
      redirect_to @threshold
    else
      render 'edit'
    end
  end
 
  def destroy
    @threshold = Threshold.find(params[:id])
    @threshold.destroy
 
    redirect_to threshold_path
  end
 
  private
    def threshold_params
      params.require(:threshold).permit(:created_at, :content, :priority, :due)
    end
end
