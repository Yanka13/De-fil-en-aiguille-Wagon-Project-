class PagesController < ApplicationController
   skip_before_action :authenticate_user!, only: :home

  def home
    @products = Product.all
  end

  def dashboard
   @projects = current_user.projects
   @offers = current_user.offers
  end
end
