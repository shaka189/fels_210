class Activity < ApplicationRecord
  belongs_to :user
  paginates_per Settings.perpage
  scope :select_fields, ->{select :id, :action, :action_type, :user_id}
  scope :order_date_desc, ->{order created_at: :desc}
end
