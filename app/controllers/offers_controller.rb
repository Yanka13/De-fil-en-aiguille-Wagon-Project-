class OffersController < ApplicationController
  def index
    @users = User.all
    @offersgeoco = Offer.where(user: @users.geocoded ) # returns offers with coordinates

    @markers = @offersgeoco.map do |offer|
      {
        lat: offer.user.latitude,
        lng: offer.user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { offer: offer }),
        image_url: helpers.asset_url('thread.png')
      }
    end
  end
end
