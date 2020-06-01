class PagesController < ApplicationController
   skip_before_action :authenticate_user!, only: :home

  def home
    @products = Product.all
  end

  def dashboard
   @projects = current_user.projects
   @offers = current_user.offers
   @user_projects = Project.where(user: current_user)

      @marker_center = {
        lat: current_user.latitude,
        lng: current_user.longitude,
        image_url: helpers.asset_url('location.png')
      }
  end
end
