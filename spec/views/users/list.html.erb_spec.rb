require "rails_helper"

RSpec.describe "users/list.html.erb" do
  it "stub template that does not exist: renders the user partial for each user" do
    assign(:users, [
      double(:email => "tien@gmail.com"),
      double(:email => "phung@gmail.com")
    ])
    stub_template "users/_user.html.erb" => "<%= user.email %><br/>"
    render
    expect(rendered).to match /tien@gmail.com/
    expect(rendered).to match /phung@gmail.com/
  end
end
