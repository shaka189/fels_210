require "rails_helper"

RSpec.describe "lessons/_form" do
  it "includes a link to new" do
    expect(controller.request.path_parameters[:action]).to be_nil
  end
end
