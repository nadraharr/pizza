class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, except: [:index, :new, :create]
  before_action :set_cart, only: [:index]

  def index
    authorize Meal
    # @meals = Meal.in_menu
    @meals = Meal.all
  end

  def show
  end

  def new
    authorize Meal
    @meal = Meal.new
  end

  def create
    @meal = Meal.new meal_params
    authorize @meal
    if @meal.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @meal.update meal_params
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @meal.destroy
    redirect_back_or_to root_path
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def set_cart
    if user_signed_in?
      @cart = Cart.find_or_create_by(user: current_user)
    else
      @cart = Cart.find_or_create_by(id: session[:cart_id])
      session[:cart_id] = @cart.id unless session[:cart_id]
    end
  end

  def meal_params
    params.require(:meal).permit(:title, :price, :in_menu, :category, ingredients: [])
  end

  def authorize_user!
    authorize @meal
  end
end
