class Activity < ApplicationRecord
  belongs_to :user
  paginates_per Settings.perpage
end
