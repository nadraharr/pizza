class CartsController < ApplicationController
  before_action :set_cart, only: [:show]

  def show
    @cart_items = @cart.cart_items
  end

  private

  def set_cart
    @cart = Cart.find_or_create_by(user: current_user)
  end
end
