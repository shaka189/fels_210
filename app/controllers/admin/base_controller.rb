class Admin::BaseController < ApplicationController
  before_action :verify_admin!

  private

  def verify_admin!
    return if current_user.admin?
    flash[:danger] = t "flash.permission_access"
    redirect_to root_path
  end
end
