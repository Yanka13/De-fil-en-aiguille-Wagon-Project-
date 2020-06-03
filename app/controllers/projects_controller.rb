class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def new
    @user = current_user
    @products = Product.all
    @project = Project.new(project_params)
    @price_per_item = params[:price].to_f
    @project.budget =  params[:project][:quantity].to_i * params[:price].to_f
    authorize @project
    @product = Product.find(project_params[:product_id])

    # display only offers with quantity > 0
    @all_offers = Offer.order('price ASC, quantity DESC').find(params[:offers_id]) if params[:offers_id]
    @offers = []
    if @all_offers.present?
      @all_offers.each do |offer|
        if offer.quantity > 0
          @offers << offer
        end
      end
    end

    # tous les mask makers à 10km à la ronde du client
    @usertocontact = User.near(current_user.address, 10)
  end

  def index
    @user_projects = policy_scope(Project).where(user: current_user)
  end

  def create
    @project = current_user.projects.new(project_params)
    authorize @project
    @project.user_id = current_user.id
    @project.product = Product.find(project_params[:product_id])
    if @project.save!
      params[:matches][:offer_ids].each do |offer_id|
        Match.create(project: @project, offer_id: offer_id.to_i, quantity: params[:matches]["#{:match_quantity_offer_}"+"#{offer_id}"])
      end

      @usertocontact = User.near(current_user.address, 10)
      @usertocontact.each do |user|
      Notification.create(project: @project, user_id: user.id, description: params[:description])

      end
         #cela représente tous les masks makers situés à 10km du client
     #@usertocontact.map(&:id).each do |id|
      #ing = Offer.create(product: @product, quantity: 0, user_id: id )
      #Match.create(project: @project, quantity: 0, offer_id: ing.id )
      #end

      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def show
    @somme = 0
    @userlocalisation = Geocoder.search(current_user.address).first.coordinates
    @matches = @project.matches
    @user_projects = Project.where(user: current_user)
    @matches.each do |match|
      @somme += match.offer.quantity * match.offer.price
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
    params.require(:project).permit(:quantity, :status, :deadline, :product_id, :budget, :description)
  end

  def match_params
    params.require(:matches).permit(:offer_ids, :match_quantity)
  end

  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end
end
