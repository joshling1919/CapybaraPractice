require 'spec_helper'
require 'rails_helper'

RSpec.feature "goals creation method", type: :feature do
  before(:each) do
    make_user
    visit new_goal_url
  end

  scenario "redirects to login page if no user is logged in" do
    click_on "Log Out"
    visit new_goal_url
    expect(page).to have_current_path(new_session_path)
  end


  scenario "shows you new goal form if logged in" do
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

RSpec.feature "User Comments", type: :feature do
  before(:each) do
    make_user
    seed_database
  end

  scenario "can fill out user comment form" do
    visit user_goals_url(1)
    save_and_open_page
    fill_in "Comment", with: "You're ugly!"
    click_on "Make Comment"
    expect(page).to have_content("You're ugly!")
    expect(page).to have_current_path(user_goals_path(1))
  end

  scenario "can fill out the goal's comment form" do
    visit goal_url(1)
    fill_in "Comment", with: "That's a lame goal!"
    click_on "Make Comment"
    expect(page).to have_content("That's a lame goal!")
    expect(page).to have_current_path(goal_path(1))
  end
end
