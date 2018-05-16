class CategoriesController < ApplicationController
  before_action :logged_in_user

  def index
    @categories = Category.order_date_desc.page(params[:page]).select :id, :name
  end

  def new
  end

  def show
  end
end
