class WordsController < ApplicationController
  before_action :logged_in_user

  def index
    @words = Word.includes(:category).select_fields.order_date_desc
      .page params[:page]
    @categories = Category.select(:id, :name)
    if !params[:category_id].nil? && params[:category_id].empty?
      @words = Word.send(params[:option], current_user.id).select_fields
        .order_date_desc.page params[:page]
    elsif category = @categories.find_by(id: params[:category_id])
      @words = category.words.send(params[:option], current_user.id)
        .select_fields.order_date_desc.page params[:page]
    else
      @words = Word.includes(:category).select_fields.order_date_desc
        .page params[:page]
    end
  end
end
