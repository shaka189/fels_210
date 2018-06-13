class CategoriesController < ApplicationController
  before_action :logged_in_user
  before_action :load_category, only: :show

  def index
    @q = Category.search params[:q]
    @categories = @q.result.select_fields.order_date_desc.page params[:page]
  end

  def show
    @lessons = @category.lessons.select_fields.order_date_desc.page params[:page]
  end

  private

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t "flash.load_category#{params[:id]}"
    redirect_to root_path
  end
end
