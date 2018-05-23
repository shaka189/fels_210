class Word < ApplicationRecord
  has_many :results
  has_many :answers, dependent: :destroy
  belongs_to :category
  paginates_per Settings.perpage
  scope :order_date_desc, ->{order created_at: :desc}
  scope :select_fields, ->{select :id, :content, :category_id}
  validates :content, presence: true, uniqueness: true
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  validate :must_be_a_answer_correct, on: [:create, :update]

  def must_be_a_answer_correct
    unless self.answers.select{|answer| answer.correct}.size == Settings.answer
      errors.add " ", I18n.t("message.must_a_answer_correct")
    end
  end
end
