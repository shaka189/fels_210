class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :results
  paginates_per Settings.lesson_perpage
  has_many :words, through: :results
  has_many :answers, through: :results
  accepts_nested_attributes_for :results
  before_create :create_word
  scope :order_date_desc, ->{order created_at: :desc}

  private

  def create_word
    @category = Category.find self.category_id
    self.words = @category.words.limit(10).order(Arel.sql('RAND()'))
  end
end
