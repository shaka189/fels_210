require "rails_helper"

RSpec.describe "lessons/show" do
  let!(:user) {FactoryBot.create :user, :user}
  let!(:category) {FactoryBot.create :category}
  let!(:activity) {FactoryBot.create :activity, user: user}
  10.times do |n|
    let!("#{n}") {FactoryBot.create :word, category: category}
  end
  let!(:lesson){FactoryBot.create :lesson, category: category, user: user}
  before {sign_in user}
  before(:each) do
    @lesson = assign(:lesson, lesson)
  end

  it "stub template renders the form partial" do
    stub_template "lessons/_form.html.erb" => "This content"
    render
    expect(rendered).to match /This content/
  end

  it "infers the controller path" do
    expect(controller.request.path_parameters[:controller]).to eq("lessons")
    expect(controller.controller_path).to eq("lessons")
  end

  it "infers the controller path" do
    expect(controller.request.http_auth_salt).to eq("http authentication")
    expect(controller.request.path_parameters[:action]).to eq("show")
  end
end
