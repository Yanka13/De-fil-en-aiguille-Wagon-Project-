class OffersController < ApplicationController
  def index
    @offers = Offer.all
    @offersgeoco = @offers.users.geocoded # returns offers with coordinates

    @markers = @offersgeoco.map do |offer|
      {
        lat: offer.user.latitude,
        lng: offer.user.longitude,
        # infoWindow: render_to_string(partial: "info_window", locals: { offer: offer })
      }
    end
  end
end
