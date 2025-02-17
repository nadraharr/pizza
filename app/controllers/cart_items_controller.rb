class CartItemsController < ApplicationController
  before_action :set_cart, only: [:create, :update, :destroy]
  before_action :set_cart_item, only: [:update, :destroy]

  def create
    @cart_item = @cart.cart_items.find_or_initialize_by(meal_id: params[:meal_id])
    @cart_item.quantity = 0 if @cart_item.new_record?
    @cart_item.quantity += params[:quantity].to_i

    if @cart_item.save
      @cart.save
      redirect_back_or_to root_path, notice: "Item was successfully added to the cart."
    else
      redirect_back_or_to root_path, alert: "Failed to add item to the cart."
    end
  end

  def update
    if @cart_item.update(cart_item_params)
      @cart.save
      redirect_back_or_to root_path, notice: "Item was successfully updated."
    else
      redirect_back_or_to root_path, alert: "Failed to update item."
    end
  end

  def destroy
    @cart_item.destroy
    @cart.save
    redirect_back_or_to root_path, notice: "Item was successfully removed from the cart."
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

  def set_cart_item
    @cart_item = @cart.cart_items.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:meal_id, :quantity)
  end
end
