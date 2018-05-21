class WordsController < ApplicationController
  before_action :logged_in_user

  def new;end

  def index
    @words = Word.select_fields.order_date_desc.page params[:page]
  end
end
