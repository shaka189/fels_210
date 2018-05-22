class Category < ApplicationRecord
  has_many :lessons
  has_many :words, dependent: :restrict_with_exception
  paginates_per Settings.cate_perpage
  scope :order_date_desc, ->{order created_at: :desc}
  scope :select_fields, ->{select :id, :name}
end
