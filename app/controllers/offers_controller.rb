class OffersController < ApplicationController
  def index

    @products = Product.all
    @stock =  0

    if params[:address].present? && params[:radius].present? && params[:product].present? && params[:price].present?
      @product = Product.find(params[:product])
      @users = User.near(params[:address], params[:radius].to_i)
      @offersgeoco = policy_scope(Offer).where(user_id: @users.map(&:id)).where(product: params[:product]).where("price <= ?", params[:price])

    elsif params[:address].present? && params[:radius].present? && params[:product].present? && params[:price] == ""
      @product = Product.find(params[:product])
      @users = User.near(params[:address], params[:radius].to_i)
      @offersgeoco = policy_scope(Offer).where(user_id: @users.map(&:id)).where(product: params[:product])

    elsif params[:address].present? && params[:radius].present? && params[:product]== "" && params[:price].present?
      @product = Product.find(params[:product])
      @users = User.near(params[:address], params[:radius].to_i)
      @offersgeoco = policy_scope(Offer).where(user_id: @users.map(&:id)).where("price <= ?", params[:price])

    elsif params[:address].present? && params[:radius].present? && params[:product] == "" && params[:price] == ""
      @users = User.near(params[:address], params[:radius].to_i)
      @offersgeoco = policy_scope(Offer).where(user_id: @users.map(&:id))

    elsif params[:address].present? && params[:radius] == "" && params[:product] == "" && params[:price] == ""
      @users = User.near(params[:address], 4)
      @offersgeoco = policy_scope(Offer).where(user_id: @users.map(&:id))

    else
      @users = User.all
      @offersgeoco = policy_scope(Offer).where(user_id: @users.map(&:id))
    end

    @offersgeoco.each do |offer| # pour bien avoir le total des produits disponible selon la recherche effectuée
      @stock += offer.quantity
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
end
