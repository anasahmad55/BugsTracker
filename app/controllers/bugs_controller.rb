class BugsController < ApplicationController
  def index
    @bugs = Bug.all
  end

  def new
    @bug = Bug.new
  end

  def create
    @bug = Bug.new(params.require(:bug).permit(:title, :description, :deadline, :bug_type, :status, :project_id, :image))
    @bug.user_id = current_user.id
    if @bug.save
      redirect_to bugs_path
    else
      render 'new'
    end
  end

  def show
    @bug = Bug.find(params[:id])
  end

end