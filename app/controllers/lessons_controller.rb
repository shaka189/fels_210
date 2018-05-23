class LessonsController < ApplicationController
  before_action :logged_in_user
  before_action :load_lesson, only: %i(show update destroy)
  before_action :load_category, only: %i(create)

  def create
    @lesson =  @category.lessons.build user: current_user
    if @lesson.save
      flash[:success] = t "flash.create_success"
      redirect_to lesson_path @lesson
    else
      flash[:danger] = @lesson.errors.full_messages.join(", ")
      redirect_to categories_path
    end
  end

  def update
    if @lesson.update_attributes lesson_params
      flash[:success] = t "update_success"
      redirect_to lesson_path @lesson
    else
      flash[:danger] = t "update_fail"
      redirect_to @category
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit :status, results_attributes: [:id, :answer_id]
  end

  def load_category
    @category = Category.find_by id: params[:category_id]
    return if @category
    flash[:danger] = t "flash.cant_find_category" + "#{params[:category_id]}"
    redirect_to root_url
  end

  def load_lesson
    @lesson = Lesson.includes(:category, words: :answers).find_by id: params[:id]
    return if @lesson
    flash[:danger] = t "flash.cant_find_lesson" + "#{params[:lesson_id]}"
    redirect_to root_path
  end
end
