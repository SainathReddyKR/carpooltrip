Given(/^I am a non\-existing user$/) do
  @user = FactoryGirl.build :user
end

When(/^I visit the website$/) do
  visit '/pages/home'
end

Then(/^I click on the link to sign up$/) do
  click_link 'Sign up'
  visit '/users/sign_up'
end

Then(/^I should enter my details in the form$/) do
  fill_in 'Email', with: @user.email
  fill_in 'Username', with: @user.username
  fill_in 'Password', with: @user.password
  fill_in 'Password confirmation', with: @user.password_confirmation
end

Then(/^I submit the form$/) do
  click_button 'Sign up'
end

Then(/^I am successfully signed up$/) do
  save_and_open_page
  expect(page).to have_content " Welcome! You have signed up successfully."
end