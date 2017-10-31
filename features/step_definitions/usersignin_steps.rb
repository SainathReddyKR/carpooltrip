Given(/^I am a user$/) do
  @user = FactoryGirl.create :existing
end

Given(/^there is a sign in page$/) do
  visit '/users/sign_in'
end

Then(/^I provide username and password$/) do
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
end

Then(/^I click on the sign in button$/) do
  click_button 'Sign in'
end

Then(/^I should be logged in and redirected to home page$/) do
  save_and_open_page
  expect(page).to have_content "Signed in successfully."
end