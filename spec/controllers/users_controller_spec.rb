require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:user) {FactoryBot.create :user, :user}
  before {sign_in user}
  context "GET #index" do
    it "render index" do
      get :index
      expect(response).to have_http_status(:ok)
      expect(response).to render_template "index"
    end
  end

  context "GET #show" do
    let(:user) {FactoryBot.create :user, :user}
    it "render show user" do
      get :show, params: {id: user.id}
      expect(response).to have_http_status(:ok)
      expect(response).to render_template "show"
    end
  end

  describe "before action" do
    context "user must" do
      it {is_expected.to use_before_action(:logged_in_user)}
      it {is_expected.to use_before_action(:load_user)}
    end
  end
end
