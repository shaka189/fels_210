class ApplicationController < ActionController::Base
  def logged_in_user
    unless user_signed_in?
      flash[:danger] = t "home.login"
      redirect_to new_user_session_path
    end
  end

  protected

  def after_sign_in_path_for resource
    if current_user.admin?
      admin_root_path
    else
      root_path
    end
  end
end
