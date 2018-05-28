class LessonsController < ApplicationController
  before_action :logged_in_user
  before_action :load_lesson, only: %i(show update)
  before_action :load_category, only: %i(create)
  before_action :load_category1, only: %i(show)

  def show
    @time_remain = @lesson.time_remaining
  end

  def index
    @categories = Category.select_fields.order_date_desc.page params[:page]
    @lessons = current_user.lessons.select_fields.order_date_desc.page params[:page]
  end
  def create
    @lesson =  @category.lessons.build user: current_user
    if @lesson.save
      flash[:success] = t "flash.create_success"
      Activity.create(action_type: "create lesson", action: @lesson.category.name ,user_id: current_user.id)
      redirect_to lessons_path
    else
      flash[:danger] = @lesson.errors.full_messages.join(", ")
      redirect_to lessons_path
    end
  end

  def update
    if @lesson.update_attributes lesson_params
      LessonFinishMailer.send_mail_finish_lesson(@lesson).deliver_later
      if @lesson.status
        flash[:success] = t "update_success"
      else
        flash[:success] = t "start_lesson"
      end
      Activity.create(action_type: "finish lesson", action: @lesson.category.name ,user_id: current_user.id)
      redirect_to lesson_path @lesson
    else
      flash[:danger] = t "update_fail"
      redirect_to @category
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit :status, :time_start, results_attributes: [:id, :answer_id]
  end

  def load_category
    @category = Category.find_by id: params[:lesson][:category_id]
    return if @category
    flash[:danger] = t :not_found
    redirect_to lessons_path
  end

  def load_lesson
    @lesson = Lesson.includes(:category, words: :answers).find_by id: params[:id]
    return if @lesson
    flash[:danger] = t "flash.cant_find_lesson" + "#{params[:lesson_id]}"
    redirect_to root_path
  end

  def load_category1
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:warning] = t :not_found1
    redirect_to categories_path
  end
end
