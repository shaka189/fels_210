require "rails_helper"
RSpec.describe Admin::CategoriesController, type: :controller do
  let(:category) {FactoryBot.create :category}
  subject {category}

  let(:category_invalid) do
    {
      content: "",
      duration: Settings.duration
    }
  end

  let(:user) {FactoryBot.create :user, :admin}
  before {sign_in user}

  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before {post :create,
        params: {category: FactoryBot.attributes_for(:category)}}
      it "creates a new category" do
        expect(assigns(:category)).to be_a Category
      end

      it "redirects after create" do
        expect(response).to redirect_to(admin_categories_path)
      end
    end

    context "invalid params" do
      before {post :create, params: {category: category_invalid}}
      it{expect(response).to redirect_to(admin_categories_path)}
    end
  end

  describe "DELETE #destroy" do
    before {delete :destroy, params: {id: subject.id}}
    context "success" do
      it "test message" do
        expect(response).to redirect_to(admin_categories_path)
      end
    end
  end

  describe "PATCH #update" do
    context "update success" do
      it "update with name " do
        patch :update, params: {id: subject.id, category:{name: "samsung"}}
        expect(flash[:success]).to match("Update success")
        expect(response).to redirect_to(admin_categories_path)
      end
    end

    context "update category" do
      it "update fail" do
        patch :update, params: {id: subject.id, category:{name: ""}}
        expect(flash[:success]).to match(I18n.t("flash.update_fail"))
        expect(response).to render_template()
      end
    end
  end
end
