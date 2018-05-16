class Admin::ActivitiesController < Admin::BaseController
  before_action :admin_user

  def index
    @activities = Activity.order_date_desc.page(params[:page]).select :id, :action, :action_type, :user_id
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new activity_params
    if @activity.save
      flash[:success] = t "flash.create_success"
    else
      flash[:danger] = t "flash.create_fail"
    end
      redirect_to admin_activities_path
  end

  private

  def activity_params
    params.require(:activity).permit :action, :action_type, :user_id
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
