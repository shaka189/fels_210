class Admin::WordsController < Admin::BaseController
  before_action :load_word, only: %i(edit update destroy)
  before_action :load_category, only: %i(create update)

  def index
    @words = Word.select_fields.order_date_desc.page params[:page]
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new word_params
    if @word.save
      flash[:success] = t "flash.create_success"
    else
      flash[:danger] = t "flash.create_fail"
    end
    redirect_to admin_words_path
  end

  def update
    if @word.update_attributes word_params
      flash[:success] = t "flash.update_success"
    else
      flash[:danger] = t "flash.update_fail"
    end
    redirect_to admin_words_path
  end

  def destroy
    if @word.destroy
      flash[:success] = t "flash.delete"
    else
      flash[:danger] = t "flash.delete_fail"
    end
    redirect_to admin_words_path
  end

  private

  def load_category
    @categories = Category.all
  end

  def word_params
    params.require(:word).permit :content, :category_id,
      answers_attributes: [:id, :content, :correct, :_destroy]
  end

  def load_word
    @word = Word.includes(:category).find_by id: params[:id]
    return if @word
    flash[:danger] = t "flash.load_word#{params[:id]}"
    redirect_to root_url
  end
end
