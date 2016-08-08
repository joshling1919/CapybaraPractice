require 'spec_helper'
require 'rails_helper'

RSpec.feature "the signup process", type: :feature do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New user"
  end


  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'username', :with => "testing_username"
      fill_in "password", with: "password"
      click_on "Create User"
    end

    scenario "redirects to goals page after signup" do
      expect(page).to have_current_path(goals_path)
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "testing_username"
    end

  end

end

RSpec.feature "logging in", type: :feature do

  feature "shows username on the homepage after login" do
    before(:each) do
      create(:user)
      visit new_session_url
      fill_in 'username', :with => "Bobert"
      fill_in "password", with: "Slobert"
      click_on "Log In"
    end

    scenario "redirects to goals page after login" do
      expect(page).to have_current_path(goals_path)
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content "Bobert"
    end

  end

end

RSpec.feature "logging out", type: :feature do

  scenario "begins with a logged out state" do
    visit new_session_url
    expect(page).not_to have_content "Log Out"
  end

  scenario "doesn't show username on the homepage after logout" do
    create(:user)
    visit new_session_url
    fill_in 'username', :with => "Bobert"
    fill_in "password", with: "Slobert"
    click_on "Log In"
    click_on "Log Out"
    expect(page).not_to have_content "testing_username"
  end

end
