class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :load_user, only: [:show]

  def show
  end

  private
  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "flash.cant_find_user" + "#{params[:id]}"
    redirect_to root_url
  end
end
