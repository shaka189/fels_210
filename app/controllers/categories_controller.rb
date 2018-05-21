class CategoriesController < ApplicationController
  before_action :logged_in_user

  def index
    @categories = Category.select_fields.order_date_desc.page params[:page]
  end

  def show;end
end
