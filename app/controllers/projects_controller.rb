class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def new
    @user = current_user
    @project = Project.new(project_params)
    @project.budget =  params[:project][:quantity].to_i * params[:price].to_f
    authorize @project
    @product = Product.find(project_params[:product_id])
    @offers = Offer.order('price ASC, quantity DESC').find(params[:offers_id]) if params[:offers_id]
  end

  def create
    @project = current_user.projects.new(project_params)
    authorize @project
    @project.user_id = current_user.id
    @product = Product.find_by(params[:product_type])
    @project.product_id = @product.id

    if @project.save!
      params[:matches][:offer_ids].each do |offer_id|
        Match.create(project: @project, offer_id: offer_id.to_i, quantity: quantity)
      end
      redirect_to project_path(@project)
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

  def destroy
    @project.destroy
    redirect_to projects_path # modifier vers le dashboard une fois créé
  end

  private

  def project_params
    params.require(:project).permit(:quantity, :status, :deadline, :product_id, :budget)
  end

  def match_params
    params.require(:matches).permit(:offer_ids, :quantity)
  end

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end
end
