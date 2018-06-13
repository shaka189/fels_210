require "rails_helper"

RSpec.describe Result, type: :model do
  context "associations" do
    it{is_expected.to belong_to :answer}
    it{is_expected.to belong_to :lesson}
    it{is_expected.to belong_to :word}
  end
end
