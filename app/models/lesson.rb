class Lesson < ApplicationRecord
  belongs_to :user
  has_many :results
  paginates_per Settings.lesson_perpage
  scope :order_date_desc, ->{order created_at: :desc}
  scope :select_fields, ->{select :id, :name, :status, :progress}
end
