require 'spec_helper'
require 'rails_helper'

RSpec.feature "goals creation method", type: :feature do
  scenario "redirects to login page if no user is logged in" do
    click_on "Log Out"
    visit new_goal_url
    expect(page).to have_current_path(new_session_path)
  end

  before(:each) do
    visit new_user_url
    fill_in 'username', :with => "testing_username"
    fill_in "password", with: "password"
    click_on "Create User"
    visit new_goal_url
  end
  scenario "shows you new goal form if logged in" do
    # create(:user)
    # visit new_user_url
    # fill_in 'username', :with => "testing_username"
    # fill_in "password", with: "password"
    # click_on "Create User"
    # visit new_goal_url
    expect(page).to have_current_path(new_goal_path)
  end



  scenario "redirects to show goal page"  do
    fill_in "content", with: "Get more sleep!"
    click_on "Create Goal"
    expect(page).to have_current_path(goal_path(1))
    expect(page).to have_content("Get more sleep!")
  end

  scenario 'Creating new comment adds it to the user index' do
    fill_in "content", with: "Get more sleep!"
    click_on "Create Goal"
    visit user_goals_url(1)
    expect(page).to have_content("Get more sleep!")
  end




end
