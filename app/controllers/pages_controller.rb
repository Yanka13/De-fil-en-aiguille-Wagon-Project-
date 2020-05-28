class PagesController < ApplicationController
   skip_before_action :authenticate_user!, only: :home

  def home
    @products = Product.all
    if params[:product].present?
    @product = Product.find (params[:product])
    end
  end

  def dashboard
   @projects = current_user.projects
   @offers = current_user.offers
  end
end
