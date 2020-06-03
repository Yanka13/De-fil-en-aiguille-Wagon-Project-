class PagesController < ApplicationController
   skip_before_action :authenticate_user!, only: :home

  def home
    @products = Product.all
  end

    def dashboard
    @projects = current_user.projects
    @offers = current_user.offers
    @user_projects = Project.where(user: current_user)

    @marker_center_dash = {
      lat: current_user.latitude,
      lng: current_user.longitude,
      image_url: helpers.asset_url('location.png')
    }

    @friends = current_user.projects.map do |project|
      project.matches.map { |match| match.offer.user }
    end

    @friends = @friends.flatten
    @markers_dash = @friends.map do |friend|
      {
        lat: friend.latitude,
        lng: friend.longitude,
        image_url: helpers.asset_url('sewing-machine.png')
      }
    end

  end
end

