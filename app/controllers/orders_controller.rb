class OrdersController < ApplicationController
  before_action :set_cart, only: [:new, :create]

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @order_items = @cart.cart_items
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user if user_signed_in?
    @order_items = @cart.cart_items

    if @order.save
      @order_items.each do |item|
        @order.order_items.create(
          meal_id: item.meal_id,
          quantity: item.quantity,
          price: item.price,
        )
      end
      @cart.cart_items.destroy_all

      redirect_to @order, notice: "Order was successfully created."
    else
      render :new
    end
  end

  private

  def set_cart
    if user_signed_in?
      @cart = Cart.find_or_create_by(user: current_user)
    else
      @cart = Cart.find_or_create_by(id: session[:cart_id])
      session[:cart_id] = @cart.id unless session[:cart_id]
    end
  end

  def order_params
    params.require(:order).permit(:total_price, :address, :phone)
  end
end
