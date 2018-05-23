class Admin::CategoriesController < Admin::BaseController
  before_action :load_category, only: %i(update destroy)

  def index
    @categories = Category.select_fields.order_date_desc.page params[:page]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "flash.create_success"
    else
      flash[:danger] = t "flash.create_fail"
    end
    redirect_to admin_categories_path
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "flash.update_success"
    else
      flash[:success] = t "flash.update_fail"
    end
    redirect_to admin_categories_path
  end

  def destroy
    begin
      @category.destroy
      flash[:success] = t :delete_cate
    rescue ActiveRecord::DeleteRestrictionError => e
      @category.errors.add(:exception, e)
      flash[:error] = "#{e}"
    ensure
      redirect_to admin_categories_path
    end
  end

  private

  def category_params
    params.require(:category).permit :name
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t "flash.load_category#{params[:id]}"
    redirect_to root_path
  end
end
