class Admin::BaseController < ApplicationController
  before_action :verify_admin!

  private

  def verify_admin!
    if user_signed_in?
      return if current_user.admin?
      flash[:danger] = t "flash.permission_access"
      redirect_to root_path
    else
      flash[:danger] = t "login"
      redirect_to root_path
    end
  end
end
