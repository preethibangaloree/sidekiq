class RestaurantsController < ApplicationController
  #before_action :set_restaurant, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  # GET /restaurants or /restaurants.json
  def index
    if params[:dish_name]
      @restaurants = Restaurant.joins(:dishes).where("dishes.name LIKE ?", "%#{params[:dish_name]}%")
    else
    @restaurants = Restaurant.all
    end
  end

  # GET /restaurants/1 or /restaurants/1.json
  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
    @restaurant.dishes.build
  end

  
  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants or /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully created." }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1 or /restaurants/1.json
  # def update
  #   if @restaurant.update(restaurant_params)
  #     if @restaurant.status_changed?
  #       RestaurantStatusJob.set(wait: 5.minutes).perform_later(@restaurant.id, @restaurant.status)
  #     end
  #     redirect_to @restaurant, notice: "Restaurant was successfully updated."
  #   else
  #     render :edit
  #   end
  # end
  def update
    if @restaurant.update(restaurant_params)
      if @restaurant.status == 'closed'
        RestaurantStatusJob.set(wait: 5.minutes).perform_later(@restaurant.id, 'closed')
      elsif @restaurant.status == 'open'
        RestaurantStatusJob.set(wait: 5.minutes).perform_later(@restaurant.id, 'open')
      end
  
      redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /restaurants/1 or /restaurants/1.json
  def destroy
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: "Restaurant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:title, :status, dishes_attributes: [:name, :price])
    end
end
