class Admin::UsersController < Admin::BaseController
  before_action :admin_user

  def index
    @users = User.order_date_desc.page(params[:page]).select :id, :name, :email
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "flash.create_success"
    else
      flash[:danger] = t "flash.create_fail"
    end
    redirect_to admin_users_path
  end

  def destroy
    @user = User.find_by id: params[:id]
    if @user.destroy
      flash[:success] = t "flash.delete"
    else
      flash[:danger] = t "flash.delete_fail"
    end
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
