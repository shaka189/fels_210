class Admin::LessonsController < Admin::BaseController
  before_action :load_lesson, only: %i(destroy)

  def index
    @lessons = Lesson.select_fields.order_date_desc.page params[:page]
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

  def load_lesson
    @lesson = lesson.find_by id: params[:id]
    return if @lesson
    flash[:danger] = t "flash.load_lesson#{params[:id]}"
    redirect_to root_path
  end
end
