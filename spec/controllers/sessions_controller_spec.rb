require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET new" do

    before(:each) do
      create(:user)
    end

    it "renders a new login page" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do

    before(:each) do
      create(:user)
    end

    it "creates a new session with valid parameters" do
      post :create, session:{username: "Bobert", password: "Slobert"}
      expect(session[:session_token]).to eq User.find_by_session_token(session[:session_token]).session_token
      expect(User.find_by_session_token(session[:session_token])).to eq User.first
      expect(response).to redirect_to(goals_url)
    end


    it "flashes an error message if invalid parameters are used" do
      post :create, session:{username: "Bobert", password: "short"}
      expect(User.find_by_session_token(session[:session_token])).to be nil
      expect(flash[:errors]).to be_present
    end
  end

end
