class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = User.find_by id: params[:followed_id]
    current_user.follow @user
    Activity.create(action_type: "follow", action: @user.email ,
      user_id: current_user.id)
    redirect_to @user
  end

  def destroy
    @user = Relationship.find_by(id: params[:id]).followed
    current_user.unfollow @user
    Activity.create(action_type: "unfollow", action: @user.email ,
      user_id: current_user.id)
    redirect_to @user
  end

end
