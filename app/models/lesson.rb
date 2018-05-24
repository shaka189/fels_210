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
  validate :words_quantity, on: :create
  scope :select_fields, ->{select :id, :name, :status, :progress}

  def time_remaining
    category.duration * 60 - (Time.zone.now - self.created_at).to_i
  end

  private

  def words_quantity
    if category.words.count <= Settings.word
      errors.add :error, I18n.t("not_enough_word")
    end
  end

  def create_word
    self.words = category.words.limit(Settings.word).order(Arel.sql('RAND()'))
  end
end
