class BugsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    projects = current_user.projects
    @bugs = []
    projects.each { |proj| @bugs.push(proj.bugs) }
    @bugs.flatten!
  end

  def new
    @bug = Bug.new
  end

  def create
    @bug = Bug.new(params.require(:bug).permit(:title, :description, :deadline, :bug_type, :status, :project_id, :screenshot))
    @bug.user_id = current_user.id
    if @bug.save
      UserMailer.with(user: current_user).created_bug.deliver_later
      redirect_to bugs_path
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    status = params.require(:bug).permit(:status)
    if status['status'] == 'started'
      @bug.bug_resolver_id = current_user.id
    end
    if @bug.update(params.require(:bug).permit(:status))
      flash[:notice] = "#{@bug.title} updated successfully"
      redirect_to bugs_path
    else
      render 'show'
    end
  end

  def destroy
    @bug.destroy
    redirect_to bug_path
  end

  private

  def set_user
    @bug = Bug.find(params[:id])
  end
end
