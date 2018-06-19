require "rails_helper"

RSpec.configure do |c|
  c.use_transactional_examples = true
end

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
    before {subject.password = ""}
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

  context "run in transactions" do
    it "count user has been created" do
      expect(User.count).to eq 2
    end

    it "count user has been created after create more" do
      FactoryBot.create :user
      expect(User.count).to eq 3
    end

    it "count user has been created in a previous example" do
      expect(User.count).to eq 2
    end
  end

  context "method test" do
    let(:user1) {FactoryBot.create :user}
    it "method follow and following" do
      user.follow(user1)
      expect(user1.followers.count).to eq 1
      expect(user.following?(user1)).to eq true
    end

    it "method unfollow and following" do
      user.unfollow(user1)
      expect(user1.followers.count).to eq 0
      expect(user.following?(user1)).to eq false
    end
  end
end
