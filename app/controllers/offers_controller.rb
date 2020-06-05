class OffersController < ApplicationController
  def index
    @products = Product.all
    @stock =  0

    if params[:address].present? && params[:radius].present? && params[:product].present? && params[:price].present?
      @product = Product.find(params[:product])
      @users = User.near(params[:address], params[:radius].to_i)
      @offersgeoco = policy_scope(Offer).where(user_id: @users.map(&:id), product: params[:product]).where("price <= ?", params[:price].to_i)

    elsif params[:address].present? && params[:radius].present? && params[:product].present? && params[:price].blank?
      @product = Product.find(params[:product])
      @users = User.near(params[:address], params[:radius].to_i)
      @offersgeoco = policy_scope(Offer).where(user_id: @users.map(&:id), product: params[:product])

    elsif params[:address].present? && params[:radius].present? && params[:product].blank? && params[:price].present?
      @product = Product.find(params[:product])
      @users = User.near(params[:address], params[:radius].to_i)
      @offersgeoco = policy_scope(Offer).where(user_id: @users.map(&:id)).where("price <= ?", params[:price].to_i)

    elsif params[:address].present? && params[:radius].present? && params[:product].blank? && params[:price].blank?
      @users = User.near(params[:address], params[:radius].to_i)
      @offersgeoco = policy_scope(Offer).where(user_id: @users.map(&:id))

    elsif params[:address].present? && params[:radius].blank? && params[:product].blank? && params[:price].blank?
      @users = User.near(params[:address], 4)
      @offersgeoco = policy_scope(Offer).where(user_id: @users.map(&:id))

    else
      @users = User.all
      @offersgeoco = policy_scope(Offer).where(user_id: @users.map(&:id))
    end

    @offersgeoco.each do |offer| # pour bien avoir le total des produits disponible selon la recherche effectuée
      @stock += offer.quantity
    end

    if params[:address].present?
      @center = Geocoder.search(params[:address]).first&.coordinates
      if @center.nil?
        address = params[:address].split(',')
        address.delete_at(0)
        @center = Geocoder.search(address.join).first.coordinates
      end

      @marker_center = {
        lat: @center[0],
        lng: @center[1],
        image_url: helpers.asset_url('location.png')
      }

    end

    @markers = @offersgeoco.map do |offer|
      {
        lat: offer.user.latitude,
        lng: offer.user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { offer: offer }),
        image_url: helpers.asset_url('sewing-machine.png')
      }
    end
  end


  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    if @offer.save
      authorize @offer
      @project = Project.find(params[:offer][:project_id])
      Match.create(project: @project, offer_id: @offer.id, quantity: @offer.quantity, status: "Commande en cours" )
      @project.user.projects.each do |project|
        ProjectChannel.broadcast_to(
          project,
          render_to_string(partial: "notification", locals: { user: current_user })
        )
      end
      redirect_to notifications_path
    else
      render "notifications/show"
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:quantity, :price, :description, :product_id)
  end
end
