class OrdersController < ApplicationController
  before_action :set_cart, only: [:new, :create]

  def index
    @orders = current_user.orders.all
  end

  def new
    @order = Order.new
    @order_items = @cart.cart_items
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total_price = @cart.total_price

    if @order.save
      @cart.cart_items.each do |item|
        @order.order_items.create(meal: item.meal, quantity: item.quantity, price: item.price)
      end
      @cart.destroy
      redirect_to order_path(@order), notice: "Order created!"
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  private

  def set_cart
    @cart = current_user.cart
  end

  def order_params
    params.require(:order).permit(:address, :phone, :total_price, :status)
  end
end
