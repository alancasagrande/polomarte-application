class TasksController < ApplicationController
  respond_to :json
  
  def create
    respond_with Task.create(name: params[:name], project_id: params[:project_id], done: params[:done])
  end
  
  def update
    respond_with Task.update(params[:id], done: params[:done])
  end
  
  def destroy
    respond_with Task.destroy(params[:id])
  end
end
