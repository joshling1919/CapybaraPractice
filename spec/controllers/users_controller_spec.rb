require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET new" do
    it "renders a new user page" do
      get :new
      expect(response).to render_template("new")
    end
  end

    context "POST create" do
      it "creates a new user with valid parameters" do
        post :create, user:{username: "Bobert", password: "Slobert"}
        user = User.last
        expect(user.username).to eq "Bobert"
        expect(response).to redirect_to(goals_url)
      end


      it "flash an error message if invalid parameters are used" do
        post :create, user:{username: "Bobert", password: "short"}
        user = User.last
        expect(user).to be nil
        expect(flash[:errors]).to be_present
      end
    end
end
