class OffersController < ApplicationController
  def index
    @products = Product.all

    if params[:address].present? && params[:radius].present? && params[:product] == ""
    @users = User.near(params[:address], params[:radius].to_i)
    @offersgeoco = policy_scope(Offer).where(user_id: @users.map(&:id)) # returns offers with coordinates

    elsif params[:address].present? && params[:radius].present? && params[:product].present?
      @product = Product.find(params[:product])
      @users = User.near(params[:address], params[:radius].to_i)
      @offersgeoco = policy_scope(Offer).where(user_id: @users.map(&:id)).where(product: params[:product]) # returns offers with coordinates

    else
    @users = User.all
    @offersgeoco = policy_scope(Offer).where(user_id: @users.map(&:id))# returns offers with coordinates

    end

    @stock =  0
    @offersgeoco.each do |offer|
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
