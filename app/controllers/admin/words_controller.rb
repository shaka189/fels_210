class Admin::WordsController < Admin::BaseController
  before_action :admin_user
  before_action :load_word, only: %i(update destroy)

  def index
    words = Word.order_date_desc.page(params[:page]).select :id, :content
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
      flash[:success] = t "flash.update_fail"
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

  def word_params
    params.require(:word).permit :content, :category_id
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def load_word
    @word = word.find_by id: params[:id]
    return if @word
    flash[:danger] = t "flash.load_word#{params[:id]}"
    redirect_to root_path
  end
end
