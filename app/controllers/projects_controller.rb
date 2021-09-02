class ProjectsController < ApplicationController
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
    if current_user.user_type == "developer"
      @projects = current_user.projects
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(params.require(:project).permit(:name, user_ids: []))
      flash[:notice] = "#{@project.name} updated successfully"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end
end
