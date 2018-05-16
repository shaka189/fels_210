class Category < ApplicationRecord
  has_many :lessons
  has_many :words
  paginates_per Settings.cate_perpage
  scope :order_date_desc, ->{order created_at: :desc}
end
