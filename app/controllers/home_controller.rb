class HomeController < ApplicationController
  def Index
    if params[:search]
      @restaurants = Restaurant.where("name LIKE ?", "%#{params[:search]}%")
    else
      @restaurants = Restaurant.all
    end
  end

  def search
  end
end
