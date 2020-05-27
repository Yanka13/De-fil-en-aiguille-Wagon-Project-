class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def new
    @user = current_user
    @project = Project.new
    authorize @project
  end

  def create
    @project = current_user.projects.new(project_params)
    authorize @project
    @project.user_id = current_user.id
    @product = Product.find_by(params[:product_type])
    @project.product_id = @product.id
    if @project.save!
      redirect_to new_project_path # modifier vers le project_show une fois créé
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:quantity, :status, :deadline, :product_id)
  end

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end
end
