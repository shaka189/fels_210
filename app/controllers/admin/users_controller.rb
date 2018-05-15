class Admin::UsersController < Admin::BaseController
  before_action :load_user, only: %i(destroy)
  def index
    @users = User.select_fields.order_date_desc.page params[:page]
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

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "flash.load_user#{params[:id]}"
    redirect_to root_url
  end
end
