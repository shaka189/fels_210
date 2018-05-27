class StaticPagesController < ApplicationController
  before_action :logged_in_user

  def home
    @lessons = current_user.lessons.select_fields.order_date_desc.page params[:page]
  end

  def help;end
end
