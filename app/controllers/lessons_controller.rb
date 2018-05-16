class LessonsController < ApplicationController
  before_action :logged_in_user
  before_action :find_lesson, only: [:show, :update, :destroy]
  before_action :find_category, only: [:create]

  def show
  end

  def create
    @lesson = Lesson.new category_id: @category.id, user_id: current_user.id
    if @lesson.save
      flash[:success] = t "flash.create_success"
      redirect_to lesson_path @lesson
    else
      flash[:danger] = t "create_lesson_fail"
      redirect_to @category
    end
  end

  def update
    if @lesson && @lesson.update_attributes(lesson_params)
      flash[:success] = t "message.update_success"
    else
      if @lesson.present?
        failed_message = @lesson.errors
      else
        failed_message = t "message.update_failed"
      end
      flash[:danger] = failed_message
    end
    redirect_to @lesson
  end

  private

  def lesson_params
    params.require(:lesson).permit :status, results_attributes: [:id, :answer_id]
  end

  def find_category
    @category = Category.find_by id: params[:category_id]
    return if @category
    flash[:danger] = t "flash.cant_find_category" + "#{params[:category_id]}"
    redirect_to root_url
  end

  def find_lesson
    @lesson = Lesson.find_by id: params[:id]
    return if @lesson
    flash[:danger] = t "flash.cant_find_lesson" + "#{params[:lesson_id]}"
    redirect_to root_path
  end
end
