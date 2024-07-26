class UsersController < ApplicationController
  before_action :authorize_user!

  def index
    @users = User.all.order(:id)
  end

  def show
    @user = User.find(params[:id])
  end

  def ban
    @user = User.find(params[:id])
    if @user.access_locked?
      @user.unlock_access!
    else
      @user.lock_access!
    end

    redirect_to users_path, notice: "User #{@user.id} #{"un" if !@user.access_locked?}banned!"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: "User destroyed!"
  end

  def set_role
    @user = User.find(params[:id])
    meth = "#{params[:role]}_role!".to_sym
    @user.send(meth)
    redirect_to users_path, notice: "User #{@user.id} now #{@user.role}"
  end

  private

  def authorize_user!
    authorize current_user
  end
end
