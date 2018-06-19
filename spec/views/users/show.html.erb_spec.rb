require "rails_helper"

describe "users/show" do
  let!(:user) {FactoryBot.create :user, :user}
  let!(:category) {FactoryBot.create :category}
  let!(:activity) {FactoryBot.create :activity, user: user}
  10.times do |n|
    let!("#{n}") {FactoryBot.create :word, category: category}
  end
  let!(:lesson){FactoryBot.create :lesson, category: category, user: user}

  before {sign_in user}

  it "should show users" do
    assign(:user, user)
    render
    expect(rendered).to match user.email
  end

  it "should render activities" do
    assign(:user, user)
    assign(:activities, [activity])
    render
    expect(rendered).to match activity.action
  end

  context "render activities" do
    before(:each) do
      assign(:activities, [activity])
    end
    it "displays both widgets" do
      assign(:user, user)
      render
      expect(rendered).to match activity.action_type
    end
  end

  # it "rendering the lesson template" do
  #   # render partial: "lessons/lesson.html.erb", locals: {lesson: lesson}
  #   # lesson = stub_model(Lesson, :name => "Lesson 1")
  #   render "lessons/lesson", lesson: lesson
  #   expect(rendered).to match lesson.category.name
  # end

  # it "render list user" do
  #   # user_1 = stub_model(User, email: "huong@gmail.com", password: "123456")
  #   render partial: "users/user", locals: {user: user}
  #   # rendered.should contains("huong@gmail.com")
  #   expect(rendered).to match user.email
  # end

  # it "View specs can render locals in an implicit partial" do
  #   render "lessons/lesson", lesson: lesson
  #   expect(rendered).to match lesson.category.name
  # end

  # it "rendering the collection" do
  #   @lessons = [lesson]
  #   assign(:lessons, [lesson])
  #   render partial: "lessons/lesson.html.erb", collection: @lessons
  #   expect(rendered).to match lesson.category.name
  # end
end

describe "lessons/lesson.html.erb" do
  it "renders the HTML template" do
    render
    expect(rendered).to match /HTML/
  end
end

describe "lessons/lesson.xml.erb" do
  it "renders the XML template" do
    render
    expect(rendered).to match /XML/
  end
end
