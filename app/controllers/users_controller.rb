class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :load_user, only: %i(show following followers)

  def index
    @users = User.select_fields.order_date_desc.page params[:page]
  end

  def show
    @unfollow_user = current_user.active_relationships.find_by followed_id: @user.id
    @follow_user = current_user.active_relationships.build
    @lessons = User.find(params[:id]).lessons.select_fields.order_date_desc.page params[:page]
    @activities = current_user.activities.order_date_desc
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.page params[:page]
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.page params[:page]
    render 'show_follow'
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "flash.load_user#{params[:id]}"
    redirect_to root_url
  end
end
