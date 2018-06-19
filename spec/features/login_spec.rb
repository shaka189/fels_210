require "rails_helper"

RSpec.feature "user login", type: :feature do
  let(:user) {FactoryBot.create :user}
  subject {user}
  before do
    visit new_user_session_path
  end

  context "No password" do
    before do
      fill_in "user[email]", with: user.email
      click_button "Login"
    end
    it{ expect(page).to have_text("Invalid Email or password.")}
  end

  context "No email" do
    before do
      fill_in "user[password]", with: user.password
      click_button "Login"
    end
    it{ expect(page).to have_text("Invalid Email or password.")}
  end

  context "user valid" do
    before do
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password
      click_button "Login"
    end
    it{ expect(page).to have_text("Signed in successfully.")}
  end

  context "user invalid" do
    before do
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password+"1"
      click_button "Login"
    end
    it{ expect(page).to have_text("Invalid Email or password.")}
  end
end
