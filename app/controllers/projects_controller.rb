class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params.require(:project).permit(:name, user_ids: []))
    if @project.save
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def index
    @projects = Project.all
    if current_user.user_type == "developer" || current_user.user_type == "qa"
      @projects = current_user.projects
    end
  end

  def show;  end

  def edit;  end

  def update
    if @project.update(params.require(:project).permit(:name, user_ids: []))
      flash[:notice] = "#{@project.name} updated successfully"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end
