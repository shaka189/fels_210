class ApplicationController < ActionController::Base
  def logged_in_user
    unless user_signed_in?
      flash[:danger] = t "login"
      redirect_to new_user_session_path
    end
  end
end
