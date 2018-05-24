class WordsController < ApplicationController
  before_action :logged_in_user

  def index
    @words = Word.includes(:category).select_fields.order_date_desc.page params[:page]
  end
end
