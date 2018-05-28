class Word < ApplicationRecord
  has_many :results
  has_many :answers, dependent: :destroy
  belongs_to :category
  paginates_per Settings.perpage
  scope :order_date_desc, ->{order created_at: :desc}
  scope :select_fields, ->{select :id, :content, :category_id}
  # validates :content, presence: true, uniqueness: true
  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  # validate :must_be_a_answer_correct, on: [:create, :update]
  scope :alls, ->(user_id){}
  scope :learned, ->(user_id){where "id in (select word_id from answers where
    correct='true' and id in (select answer_id from results where lesson_id in (select id from
      lessons where user_id = #{user_id})))"}
  scope :unlearned, ->(user_id){where "id in (select word_id from answers where
    correct='false' and id in (select answer_id from results where lesson_id in (select id from
      lessons where user_id = #{user_id})))"}
  def must_be_a_answer_correct
    unless self.answers.select{|answer| answer.correct}.size == Settings.answer
      errors.add " ", I18n.t("message.must_a_answer_correct")
    end
  end
end
