class Admin::LessonsController < Admin::BaseController
  before_action :admin_user
  before_action :load_word, only: %i(update destroy)

  def index
    @lessons = Lesson.order_date_desc.page(params[:page]).select :id, :name, :status, :progress
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new lesson_params
    if @lesson.save
      flash[:success] = t "flash.create_success"
    else
      flash[:danger] = t "flash.create_fail"
    end
      redirect_to admin_lessons_path
  end

  def update
    if @lesson.update_attributes lesson_params
      flash[:success] = t "flash.update_success"
    else
      flash[:success] = t "flash.update_fail"
    end
    redirect_to admin_lessons_path
  end

  def destroy
    if @lesson.destroy
      flash[:success] = t "flash.delete"
    else
      flash[:danger] = t "flash.delete_fail"
    end
    redirect_to admin_lessons_path
  end

  private

  def lesson_params
    params.require(:lesson).permit :name, :status, :progress,
      :user_id, :category_id
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def load_lesson
    @lesson = lesson.find_by id: params[:id]
    return if @lesson
    flash[:danger] = t "flash.load_lesson#{params[:id]}"
    redirect_to root_path
  end
end
