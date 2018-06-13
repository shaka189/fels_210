require "rails_helper"

RSpec.describe Word, type: :model do
  let!(:category) {FactoryBot.create :category}

  context "validates" do
    it {should validate_presence_of(:content)}
  end

  context "associations" do
    it{is_expected.to have_many :results}
    it{is_expected.to have_many :answers}
    it{is_expected.to belong_to :category}
  end

  describe "#one" do
    it "oneanswer" do
      word = FactoryBot.build :word, category: category
      if word.answers.select{|answer| answer.correct}.size == Settings.answer_size
        expect(word.errors[:one]).not_to include(I18n.t("message.must_a_answer_correct"))
      end
    end
  end

  context "columns" do
    it {is_expected.to have_db_column(:content).of_type(:string)
      .with_options(presence: true)}
    it {is_expected.to have_db_column(:category_id).of_type(:integer)}
  end
end
