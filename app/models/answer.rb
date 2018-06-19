class Answer < ApplicationRecord
  belongs_to :word
  has_many :results, dependent: :destroy

  validates :content, presence: true

  scope :answer_correct, ->{where(correct: true).first}
  scope :correct, ->{where(correct: true)}
end
