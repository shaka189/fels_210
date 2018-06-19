require "rails_helper"

RSpec.describe User, :type => :model do
  let(:user) {FactoryBot.create :user}
  subject {user}

  context "user is invalid" do
    user = FactoryBot.build :user, :invalid_email
    it "invalid email" do
      expect(user).not_to be_valid
    end
  end

  context "when email is not valid" do
    before {subject.email = ""}
    it {is_expected.not_to be_valid}
  end

  context "when email is too long" do
    before {subject.email = Faker::Internet.email(Faker::Lorem.characters(255))}
    it {is_expected.not_to be_valid}
  end

  context "when pasword is not valid" do
    before {subject.email = ""}
    it {is_expected.not_to be_valid}
  end

  context "when password is too short" do
    before {subject.email = Faker::Lorem.characters(5)}
    it {is_expected.not_to be_valid}
  end

  context "associations" do
    it{is_expected.to have_many :lessons}
    it{is_expected.to have_many :activities}
    it{is_expected.to have_many :active_relationships}
    it{is_expected.to have_many :passive_relationships}
    it{is_expected.to have_many :following}
    it{is_expected.to have_many :followers}
  end

  context "validate" do
    it {is_expected.to validate_presence_of(:email)}
    it {is_expected.to validate_length_of(:email).is_at_most(
      Settings.user.email.maximum_length)}
    it {is_expected.to validate_presence_of(:password)}
    it {is_expected.to validate_length_of(:password).is_at_least(
      Settings.user.password.minimum_length)}
  end

  context "columns" do
    it {is_expected.to have_db_column(:email).of_type(:string)
      .with_options(length: {maximum: Settings.user.email.maximum_length},
        presence: true)}
    it {is_expected.to have_db_column(:encrypted_password).of_type(:string)}
    it {is_expected.to have_db_column(:admin).of_type(:boolean)}
    it {is_expected.to have_db_column(:reset_password_token).of_type(:string)}
    it {is_expected.to have_db_column(:reset_password_sent_at)
      .of_type(:datetime)}
    it {is_expected.to have_db_column(:remember_created_at).of_type(:datetime)}
    it {is_expected.to have_db_column(:sign_in_count).of_type(:integer)}
    it {is_expected.to have_db_column(:reset_password_token).of_type(:string)}
    it {is_expected.to have_db_column(:current_sign_in_at).of_type(:datetime)}
    it {is_expected.to have_db_column(:last_sign_in_at).of_type(:datetime)}
    it {is_expected.to have_db_column(:current_sign_in_ip).of_type(:string)}
    it {is_expected.to have_db_column(:last_sign_in_ip).of_type(:string)}
   end
end
