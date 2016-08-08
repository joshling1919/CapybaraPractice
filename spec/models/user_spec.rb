require 'rails_helper'

before(:each) do
  bob = User.new
end

RSpec.describe User, type: :model do
  it "should validate length of password" do
    should validate_length_of(:password).is_at_least(6)
  end

  it "should validate presence of usernamer" do
    should validate_presence_of(:username)
  end

  it "should validate uniquness of username" do
    should validate_uniqueness_of(:username)
  end

  it "should validate presence of password digest" do
    should validate_presence_of(:password_digest)
  end

  it "should have a session token after intiailize" do
    should validate_presence_of(:password_digest)
  end
end
