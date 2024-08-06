class CartsController < ApplicationController
  before_action :set_cart, only: [:show]

  def show
    @cart_items = @cart.cart_items
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
end
