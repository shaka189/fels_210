class Lesson < ApplicationRecord
  before_create :create_word
  after_create :send_mail

  belongs_to :user
  belongs_to :category
  has_many :results
  has_many :words, through: :results
  has_many :answers, through: :results
  paginates_per Settings.lesson_perpage

  validate :words_quantity, on: :create

  accepts_nested_attributes_for :results
  delegate :correct, :to => :answers, :allow_nil => true

  scope :order_date_desc, ->{order created_at: :desc}
  scope :select_fields, ->{select :id, :name, :status, :progress, :created_at,
    :category_id}

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

  def send_mail
    NotifyFinishLessonJob.delay(run_at: 10.seconds.from_now).perform_later(self)
  end
end

