class Word < ApplicationRecord
  has_many :results
  has_many :answers, dependent: :destroy
  belong_to :category
end
