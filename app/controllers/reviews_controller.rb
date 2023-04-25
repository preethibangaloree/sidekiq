class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new
    # @dish = Dish.find(params[:dish_id])
    # @review = @dish.reviews.build
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    # @dish = Dish.find(params[:dish_id])
    @review = @dish.reviews.build(review_params)
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Review submitted successfully.'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rate, :comments, :reviewable_type, :reviewable_id)
  end
end
