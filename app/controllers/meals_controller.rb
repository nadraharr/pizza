class MealsController < ApplicationController
  before_action :authorize_user!

  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new meal_params
    if @meal.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
    if @meal.update meal_params
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_back_or_to root_path
  end

  private

  def meal_params
    params.require(:meal).permit(:title, :price, :in_menu, :category, ingredients: [])
  end

  def authorize_user!
    authorize Meal.new
  end
end
