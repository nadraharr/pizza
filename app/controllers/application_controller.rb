class ApplicationController < ActionController::Base
  include Pundit::Authorization

  allow_browser versions: :modern
  # before_action :authenticate_user!
  # after_action :verify_authorized

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action!"
    redirect_back_or_to(root_path)
  end
end
