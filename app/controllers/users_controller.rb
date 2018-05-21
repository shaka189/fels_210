class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :load_user, only: %i(show)
  def show;end

  private
  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "flash.load_user#{params[:id]}"
    redirect_to root_url
  end
end
