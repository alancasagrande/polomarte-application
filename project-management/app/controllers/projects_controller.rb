class ProjectsController < ApplicationController
  respond_to :json
  
  def index
    respond_with Project.all    
  end
  
  def show
    respond_with Project.find(params[:id])
  end
  
  def create
    respond_with Project.create(params[:id])
  end
  
  def update
    respond_with Project.update(params[:id])
  end
  
  def destroy
    respond_with Project.destroy(params[:id])
  end
end