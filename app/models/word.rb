class Word < ApplicationRecord
  has_many :results
  has_many :answers, dependent: :destroy
  belongs_to :category
  paginates_per Settings.perpage
  scope :order_date_desc, ->{order created_at: :desc}
end
