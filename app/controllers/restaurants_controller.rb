class RestaurantsController < ApplicationController
  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @restaurants }
    end
  end


def userrest
  @user=User.where(id: session[:user_id]).first

@selected_rest=@user.restaurants
@restaurant_reviews=User.where(id: session[:user_id]).first.restaurants.first.reviews


respond_to do |format|
      format.html # userest.html.erb
      format.json { render json: @selected_rest }
    
end

end


def search


@restaurants = Restaurant.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @restaurants }
    end

end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
   @restaurant=Restaurant.find(params[:id])
  end

  # GET /restaurants/new
  # GET /restaurants/new.json
  def new
    @restaurant = Restaurant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restaurant }
    end
  end

  # GET /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(params[:restaurant])
    @restaurant.user_id=current_user.id

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render json: @restaurant, status: :created, location: @restaurant }
      else
        format.html { render action: "new" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /restaurants/1
  # PUT /restaurants/1.json
  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :ok }
    end
  end
end
