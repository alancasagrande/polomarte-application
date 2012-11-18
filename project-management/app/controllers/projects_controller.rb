class ProjectsController < ApplicationController
  respond_to :json
  
  def index
    respond_with Project.all, :include => { :tasks => { :only => [:done] } }
  end
  
  def show
    respond_with Project.find(params[:id]), :include => :tasks
  end
  
  def create
    respond_with Project.create(name: params[:name])
  end
  
  def destroy
    respond_with Project.destroy(params[:id])
  end
end
