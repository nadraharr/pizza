class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def show
  end

  def new
    @order = current_user.orders.build
  end

  def create
    @order = current_user.orders.build(order_params)
    @order.calculate_total

    if @order.save
      redirect_to @order, notice: "Order was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update(order_params)
      @order.calculate_total
      redirect_to @order, notice: "Order was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: "Order was successfully destroyed."
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status, order_items_attributes: [:id, :meal_id, :quantity, :price, :_destroy])
  end
end
