class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :ban, :set_role]
  before_action :authorize_user!, except: [:index]

  def index
    authorize User
    @users = User.all.order(:id)
  end

  def show
  end

  def ban
    @user.access_locked? ? @user.unlock_access! : @user.lock_access!
    redirect_to users_path, notice: "User #{@user.id} #{"un" if !@user.access_locked?}banned!"
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "User destroyed!"
  end

  def set_role
    meth = "#{params[:role]}_role!".to_sym
    @user.send(meth)
    redirect_to users_path, notice: "User #{@user.id} now #{@user.role}"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_user!
    authorize @user
  end
end
