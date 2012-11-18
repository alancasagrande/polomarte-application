class TasksController < ApplicationController
  respond_to :json
  
  def create
    respond_with Task.create(name: params[:name], project_id: params[:project_id])
  end
  
  def destroy
    respond_with Task.destroy(params[:id])
  end
end
