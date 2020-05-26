class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def new
    @user = current_user
    @project = Project.new
    authorize @project
  end

  def create

  end

  private

  def project_params
    params.require(:project).permit(:quantity, :status, :deadline)
  end

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end
end
