Given(/^I am an existing user and I go to sign in page$/) do
  @user = FactoryGirl.create :existing1member
  @user = FactoryGirl.create :existing1
end

Given(/^I provide username and password and sign in$/) do
  visit '/users/sign_in'
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button 'Sign in'
  expect(page).to have_content "Signed in successfully."
end

Then(/^I go to add ride as a driver page$/) do
  visit 'driverrides/new'
end

Then(/^I enter origin$/) do
  find("input[id$='txtautocomplete']").set('Victory Monument')
end

Then(/^I enter destination$/) do
  find("input[name$='driverride[destination]']").set('Pathumthani')
end

Then(/^I enter departure details$/) do
  fill_in 'Departure Date', :with => '12/12/2016'
  #find("input[id$='driverride_departuretime_4i']").find(:xpath, '15').select_option
  select "00", :from => "driverride_departuretime_4i"
end

Then(/^I enter number of available seats$/) do
  fill_in 'Number of seats', :with => '5'
end

Then(/^I select the gender of the passenger i would like to travel$/) do
  check('Any Gender')
end

Then(/^I select what potential passenger should be ok with$/) do
  check('Music')
end

Then(/^I select whether I like to share gas price or not$/) do
  choose('Yes')
end

Then(/^I submit the the form$/) do
  click_button 'Create Driverride'
end

Then(/^I should be redirected to the new ride page$/) do
  save_and_open_page
  expect(page).to have_content "Pathumthani"
end
