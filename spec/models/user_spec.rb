# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "should validate length of password" do
      should validate_length_of(:password).is_at_least(6)
    end

    it "should validate presence of usernamer" do
      should validate_presence_of(:username)
    end

    it "should validate uniquness of username" do
      a = User.create(username: "Josh", password: "password")
      b = User.new(username: "Josh", password: "password")
      expect(b.valid?).to be false
    end

    it "should validate presence of password digest" do
      should validate_presence_of(:password_digest)
    end

    it "should have a session token after intiailize" do
      should validate_presence_of(:password_digest)
    end
  end

  describe "is_password?(password)" do
    before(:each) do
      @bobert = create(:user)
    end
    it "should take password and return true if it is the same" do
      expect(@bobert.is_password?("Slobert")).to be true
    end

    it "should take password and return false if it is different" do
      expect(@bobert.is_password?("Grover")).to be false
    end
  end

  describe "find_by_credentials(username,password)" do
    before(:each) do
      @bob = create(:user)
    end
    
    it "should be able to find user if credentials match" do
      expect(User.find_by_credentials("Bobert","Slobert")).to eq @bob
    end
    it "should return nil if credentials dont match" do
      expect(User.find_by_credentials("Bobert","Grover")).to be nil
    end
  end

  describe "assocations" do
    it "should have many goals"
    it "should have many comments (as the author)"
    it "should have many comments (as the subject)"

  end


end
